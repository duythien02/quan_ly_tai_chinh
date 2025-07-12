// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../error/api_error.dart';

extension DioResponseHelpers on Response<dynamic> {
  ApiError get apiError {
    if (data is Map) {
      return ApiError(
        status: (data as Map)['status'],
        code: (data as Map)['code'].toString(),
        message: (data as Map)['message']?.toString(),
      );
    }

    return ApiError(
      code: statusCode?.toString(),
    );
  }
}
