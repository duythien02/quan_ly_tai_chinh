import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/access_token_remove_usecase.dart';
import '../../../domain/usecases/access_token_save_usecase.dart';
import '../../../domain/usecases/auth/refresh_token_usecase.dart';
import '../../../domain/usecases/refresh_token_get_usecase.dart';
import '../../../domain/usecases/refresh_token_remove_usecase.dart';
import '../../../domain/usecases/refresh_token_save_usecase.dart';
import '../../../injector/injector.dart';
import '../../logger/logger.dart';
import '../../params/params.dart';
import '../../routes/app_router.dart';
import '../end_points.dart';
import 'header_interceptor.dart';

@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  final AccessTokenSaveUseCase _accessTokenSaveUseCase =
      getIt<AccessTokenSaveUseCase>();
  final AccessTokenRemoveUseCase _accessTokenRemoveUseCase =
      getIt<AccessTokenRemoveUseCase>();
  final RefreshTokenGetUseCase _refreshTokenGetUseCase =
      getIt<RefreshTokenGetUseCase>();
  final RefreshTokenSaveUseCase _refreshTokenSaveUseCase =
      getIt<RefreshTokenSaveUseCase>();
  final RefreshTokenRemoveUseCase _refreshTokenRemoveUseCase =
      getIt<RefreshTokenRemoveUseCase>();

  final RefreshTokenUseCase _refreshTokenUseCase = getIt<RefreshTokenUseCase>();

  @override
  Future<void> onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    // Nếu lỗi là 401 Unauthorized và không phải lỗi của chính API refresh token
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != EndPoints.refreshToken) {
      try {
        Log.error('Access token expired. Attempting to refresh token...');
        final currentRefreshToken = await _refreshTokenGetUseCase();

        if (currentRefreshToken.isNotEmpty) {
          final refreshResult = await _refreshTokenUseCase(
            params:
                RefreshTokenRequestParams(refreshToken: currentRefreshToken),
          );

          if (refreshResult.data != null) {
            final newAccessToken = refreshResult.data!.accessToken;
            final newRefreshToken = refreshResult.data!.refreshToken;

            // Lưu access token và refresh token mới
            await _accessTokenSaveUseCase(
              params: newAccessToken,
            ); // Cập nhật cách lưu access token
            await _refreshTokenSaveUseCase(
              params: newRefreshToken,
            ); // Cập nhật cách lưu refresh token

            Log.info(
              'Token refreshed successfully. Retrying original request.',
            );

            // Cập nhật access token cho yêu cầu gốc và thử lại
            final opts = err.requestOptions;
            opts.headers['Authorization'] = 'Bearer $newAccessToken';

            // Tạo một Dio instance mới để tránh lặp vô hạn hoặc deadlock
            // Đây là một Dio instance không có interceptor này để tránh chuỗi lặp lại
            final Dio dioRetry = Dio(
              BaseOptions(
                baseUrl: opts.baseUrl, // Sử dụng baseUrl của request gốc
              ),
            );
            // Thêm lại HeaderInterceptor nếu nó cần cho request retry
            dioRetry.interceptors.add(
              HeaderInterceptor(
                () async => {
                  'Authorization': 'Bearer $newAccessToken',
                  // Thêm các header cố định khác nếu có
                },
              ),
            );

            final response = await dioRetry.fetch(opts);
            return handler.resolve(response);
          } else {
            // Refresh token thất bại (refresh token hết hạn hoặc không hợp lệ)
            Log.error(
              'Failed to refresh token: ${refreshResult.error?.message}',
            );
            await _accessTokenRemoveUseCase(); // Xóa access token cũ
            await _refreshTokenRemoveUseCase(); // Xóa refresh token cũ
            getIt<AppRouter>().pushAndPopUntil(
              const AuthRoute(),
              predicate: (final _) => false,
            );
            return handler.next(err);
          }
        } else {
          Log.warning('No refresh token available. Logging out.');
          await _accessTokenRemoveUseCase();
          return handler.next(err);
        }
      } catch (e, st) {
        Log.error('Error during token refresh: $e , $st');
        await _accessTokenRemoveUseCase();
        await _refreshTokenRemoveUseCase();
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}
