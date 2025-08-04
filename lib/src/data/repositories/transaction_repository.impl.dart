import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/extensions/dio_response.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/mappers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../injector/injector.dart';
// import '../datasources/local/cache/hive/ez_cache.dart';
import '../../core/params/params.dart';
import '../datasources/remote/transaction_api_service.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(
    this._transactionApiService,
    // this._ezCache,
  );
  final TransactionApiService _transactionApiService;
  // final EZCache _ezCache;

  @override
  Future<DataState<TransactionSummary>> getTransactionSummary(
    final GetTransactionSummaryRequestParams params,
  ) async {
    try {
      final httpResponse =
          await _transactionApiService.getTransactionSummary(params);
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
    } catch (_, stackTrace) {
      print(stackTrace);
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<void>> createTransaction(
    final CreateTransactionRequestParams params,
  ) async {
    try {
      final httpResponse =
          await _transactionApiService.createTransaction(params);
      if (httpResponse.status != HttpStatus.ok) {
        return DataFailure(
          ApiError(
            message: httpResponse.message,
          ),
        );
      }
      if (httpResponse.status == HttpStatus.ok) {
        // return DataSuccess(getIt<Mapper>().tryConvert(httpResponse.data));
      }
      return DataFailure(
        ApiError(
          code: httpResponse.code,
          message: httpResponse.message,
        ),
      );
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_, stackTrace) {
      print(stackTrace);
      return const DataFailure(null);
    }
  }
}
