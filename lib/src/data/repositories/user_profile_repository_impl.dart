import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/extensions/dio_response.dart';
import '../../core/resources/data_state.dart';
import '../../core/params/params.dart';
import '../../core/utils/mappers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../../injector/injector.dart';
import '../datasources/remote/user_profile_api_service.dart';

@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl(this._userProfileApiService);
  final UserProfileApiService _userProfileApiService;

  @override
  Future<DataState<UserProfile?>> getUserProfile(
    final GetUserProfileRequestParams params,
  ) async {
    try {
      final httpResponse = await _userProfileApiService.getUserProfile(params);
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
}
