import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/extensions/dio_response.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/mappers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/account_repository.dart';
import '../../injector/injector.dart';
import '../datasources/local/cache/hive/ez_cache.dart';
import '../datasources/remote/account_api_service.dart';
import '../../core/params/params.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(
    this._accountApiService,
    this._ezCache,
  );
  final AccountApiService _accountApiService;
  final EZCache _ezCache;

  @override
  Future<DataState<Account?>> getAccounts(
    final GetAccountsRequestParams params,
  ) async {
    try {
      final httpResponse = await _accountApiService.getAccounts(params);
      if (httpResponse?.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse?.message,
          ),
        );
      }
      if (httpResponse?.status == HttpStatus.ok) {
        return DataSuccess(getIt<Mapper>().tryConvert(httpResponse?.data));
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
  Future<DataState<AccountDocs?>> createAccount(
    final CreateAccountRequestParams params,
  ) async {
    try {
      final httpResponse = await _accountApiService.createAccount(params);
      if (httpResponse?.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse?.message,
          ),
        );
      }
      if (httpResponse?.status == HttpStatus.ok) {
        _ezCache.authDao.saveHasAccount(true);
        return DataSuccess(getIt<Mapper>().tryConvert(httpResponse?.data));
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
  Future<DataState<Currency?>> getCurrencies(
    final GetCurrenciesRequestParams params,
  ) async {
    try {
      final httpResponse = await _accountApiService.getCurrencies(params);
      if (httpResponse?.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse?.message,
          ),
        );
      }
      if (httpResponse?.status == HttpStatus.ok) {
        return DataSuccess(getIt<Mapper>().tryConvert(httpResponse?.data));
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
}
