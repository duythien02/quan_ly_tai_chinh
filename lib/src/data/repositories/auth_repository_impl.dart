import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/extensions/dio_response.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/mappers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/entities/login.dart';
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
  Future<DataState<Register?>> register(
    final RegisterRequestParams params,
  ) async {
    try {
      final httpResponse = await _authApiService.register(params);
      if (httpResponse?.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse?.message,
          ),
        );
      }
      if (httpResponse?.status == HttpStatus.ok) {
        return DataSuccess(
          getIt<Mapper>().tryConvert(httpResponse?.data),
        );
      }
      return DataFailure(
        ApiError(
          code: httpResponse?.code,
          message: httpResponse?.message,
        ),
      );
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<Login?>> login(
    final LoginRequestParams params,
  ) async {
    try {
      // final httpResponse = await _authApiService.login(params);
      // if (httpResponse?.status != HttpStatus.ok) {
      //   return DataFailure(
      //     ApiError(
      //       message: httpResponse?.message,
      //     ),
      //   );
      // }
      // if (httpResponse?.status == HttpStatus.ok) {
      //   return DataSuccess(
      //     getIt<Mapper>().tryConvert(httpResponse?.data),
      //   );
      // }
      return const DataFailure(null);
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<void> saveRegister(final Register register) async {
    _ezCache.registerDao.saveRegister(register);
  }
}
