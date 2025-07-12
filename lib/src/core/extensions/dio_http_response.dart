// Package imports:
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../error/api_error.dart';
import '../network/ez_network.dart';

extension HttpResponseHelper on HttpResponse {
  DioException get dioError => DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
        type: DioExceptionType.badResponse,
      );
  ApiError get apiError => ApiError(
        code: response.statusCode?.toString(),
        message: response.statusMessage,
      );
}
