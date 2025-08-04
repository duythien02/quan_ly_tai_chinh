import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../core/params/params.dart';
import '../../models/models.dart';

part 'user_profile_api_service.g.dart';

@RestApi()
abstract class UserProfileApiService {
  factory UserProfileApiService(final Dio dio, {final String baseUrl}) =
      _UserProfileApiService;

  @GET(EndPoints.getMe)
  Future<GetUserProfileResponseModel> getUserProfile(
    @Queries() final GetUserProfileRequestParams params,
  );
}
