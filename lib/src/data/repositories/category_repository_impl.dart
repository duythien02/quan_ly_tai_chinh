import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/params/params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/mappers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/category_repository.dart';
import '../../injector/injector.dart';
import '../datasources/remote/category_api_service.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this._categoryApiService);

  final CategoryApiService _categoryApiService;

  @override
  Future<DataState<Category?>> getCategories(
    final GetCategoriesRequestParams params,
  ) async {
    try {
      final httpResponse = await _categoryApiService.getCategories(
        params,
      );
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
          message: httpResponse?.message,
        ),
      );
    } on DioException catch (error) {
      return DataFailure(error.response?.data);
    } catch (_) {
      return const DataFailure(null);
    }
  }
}
