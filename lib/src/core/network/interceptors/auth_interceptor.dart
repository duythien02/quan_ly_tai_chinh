import 'package:dio/dio.dart';
import '../../../data/datasources/local/key/keys.dart';
import '../../../injector/injector.dart';
import '../../config/defines/keys.dart';
import '../../params/auth/refresh_token_request_params.dart';
import '../../resources/data_state.dart';
import '../../../domain/usecases/access_token_get_usecase.dart';
import '../../../domain/usecases/access_token_remove_usecase.dart';
import '../../../domain/usecases/access_token_save_usecase.dart';
import '../../../domain/usecases/auth/refresh_token_usecase.dart';
import '../../../domain/usecases/refresh_token_get_usecase.dart';
import '../../../domain/usecases/refresh_token_save_usecase.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(
    this._refreshTokenUseCase,
    this._refreshTokenGetUseCase,
    this._refreshTokenSaveUseCase,
    this._accessTokenGetUseCase,
    this._accessTokenSaveUseCase,
    this._accessTokenRemoveUseCase,
  );
  final RefreshTokenUseCase _refreshTokenUseCase;
  final RefreshTokenGetUseCase _refreshTokenGetUseCase;
  final RefreshTokenSaveUseCase _refreshTokenSaveUseCase;
  final AccessTokenGetUseCase _accessTokenGetUseCase;
  final AccessTokenSaveUseCase _accessTokenSaveUseCase;
  final AccessTokenRemoveUseCase _accessTokenRemoveUseCase;

  late final Dio _dio = getIt<Dio>(instanceName: kApiDio);

  bool _isRefreshing = false;

  // Hàng đợi chứa các request bị lỗi 401
  // Mỗi phần tử là một cặp (Record) chứa lỗi và handler tương ứng
  final List<(DioException, ErrorInterceptorHandler)> _queue = [];

  @override
  Future<void> onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Thêm request lỗi vào hàng đợi
      _queue.add((err, handler));

      // Nếu đang có một tiến trình refresh token khác chạy,
      // thì không làm gì cả. Request đã nằm trong hàng đợi và sẽ được xử lý sau.
      if (_isRefreshing) {
        return;
      }

      _isRefreshing = true;

      try {
        final refreshToken = await _refreshTokenGetUseCase();
        final result = await _refreshTokenUseCase(
          params: RefreshTokenRequestParams(refreshToken: refreshToken),
        );

        if (result is DataSuccess && result.data != null) {
          final authResponse = result.data!;
          // Lưu token mới
          await _accessTokenSaveUseCase(
            params: authResponse.accessToken ?? '',
          );
          await _refreshTokenSaveUseCase(
            params: authResponse.refreshToken ?? '',
          );

          final newAccessToken = await _accessTokenGetUseCase();

          // Retry tất cả các request trong hàng đợi với token mới
          for (final (originalError, originalHandler) in _queue) {
            // LẤY requestOptions TỪ originalError (DioException)
            final requestOptions = originalError.requestOptions;
            requestOptions.headers[Keys.authorization] = newAccessToken;

            try {
              final response = await _dio.fetch(requestOptions);
              originalHandler.resolve(response);
            } on DioException catch (e) {
              originalHandler.reject(e);
            }
          }
        } else {
          // Nếu refresh token thất bại, báo lỗi cho tất cả request đang chờ
          await _accessTokenRemoveUseCase();
          for (final (originalError, originalHandler) in _queue) {
            originalHandler.reject(originalError);
          }
        }
      } catch (e) {
        // Bắt các lỗi khác và báo lỗi cho tất cả request
        for (final (originalError, originalHandler) in _queue) {
          originalHandler.reject(originalError);
        }
      } finally {
        // Dọn dẹp hàng đợi và mở khóa
        _isRefreshing = false;
        _queue.clear();
      }
    } else {
      // Nếu không phải lỗi 401, cho qua
      return handler.next(err);
    }
  }
}
