import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../models/auth/response/register_response_model.dart';
import '../../../core/params/params.dart';

@RestApi()
abstract class AuthApiService {
  // @POST(EndPoints.login)
  // Future<Login> login(@Body() final LoginRequestParams params);

  @POST(EndPoints.register)
  Future<RegisterResponseModel?> register(
    @Body() final RegisterRequestParams params,
  );
}
