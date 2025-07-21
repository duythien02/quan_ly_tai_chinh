import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../core/params/params.dart';
import '../../models/models.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(final Dio dio, {final String baseUrl}) =
      _AuthApiService;

  @POST(EndPoints.register)
  Future<AuthResponseModel> register(
    @Body() final RegisterRequestParams params,
  );
  @POST(EndPoints.login)
  Future<AuthResponseModel> login(
    @Body() final LoginRequestParams params,
  );
  @POST(EndPoints.refreshToken)
  Future<AuthResponseModel> refreshToken(
    @Body() final RefreshTokenRequestParams params,
  );
}
