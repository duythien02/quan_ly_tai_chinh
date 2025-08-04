import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../core/params/params.dart';
import '../../models/models.dart';

part 'category_api_service.g.dart';

@RestApi()
abstract class CategoryApiService {
  factory CategoryApiService(final Dio dio, {final String baseUrl}) =
      _CategoryApiService;

  @GET(EndPoints.getCategories)
  Future<GetCategoriesResponseModel?> getCategories(
    @Queries() final GetCategoriesRequestParams params,
  );
}
