import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/extensions/dio_response.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/mappers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../injector/injector.dart';
import '../datasources/local/cache/hive/ez_cache.dart';
import '../datasources/remote/auth_api_service.dart';
import '../../core/params/params.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._authApiService,
    this._ezCache,
  );
  final AuthApiService _authApiService;
  final EZCache _ezCache;

  @override
  Future<DataState<User?>> register(
    final RegisterRequestParams params,
  ) async {
    try {
      final httpResponse = await _authApiService.register(params);
      if (httpResponse.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse.message,
          ),
        );
      }
      if (httpResponse.status == HttpStatus.ok) {
        return DataSuccess(getIt<Mapper>().tryConvert(httpResponse.data));
      }
      return DataFailure(
        ApiError(
          code: httpResponse.code,
          message: httpResponse.message,
        ),
      );
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<User?>> login(
    final LoginRequestParams params,
  ) async {
    try {
      final httpResponse = await _authApiService.login(params);
      if (httpResponse.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse.message,
          ),
        );
      }
      if (httpResponse.status == HttpStatus.ok) {
        return DataSuccess(
          getIt<Mapper>().tryConvert(httpResponse.data),
        );
      }
      return const DataFailure(null);
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<void> saveUser(
    final User user,
  ) async {
    _ezCache.saveRefreshToken(user.refreshToken);
    _ezCache.saveAccessToken(user.accessToken);
    _ezCache.userDao.saveUser(user);
    _ezCache.userDao.saveHasAccount(user.hasAccount ?? false);
  }

  @override
  Future<DataState<User?>> refreshToken(
    final RefreshTokenRequestParams params,
  ) async {
    try {
      final httpResponse = await _authApiService.refreshToken(params);
      if (httpResponse.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse.message,
          ),
        );
      }
      if (httpResponse.status == HttpStatus.ok) {
        return DataSuccess(
          getIt<Mapper>().tryConvert(httpResponse.data),
        );
      }
      return const DataFailure(null);
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }
}
