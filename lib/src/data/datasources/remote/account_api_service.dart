import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../core/params/params.dart';
import '../../models/models.dart';

part 'account_api_service.g.dart';

@RestApi()
abstract class AccountApiService {
  factory AccountApiService(final Dio dio, {final String baseUrl}) =
      _AccountApiService;

  @GET(EndPoints.getAccounts)
  Future<GetAccountsResponseModel?> getAccounts(
    @Queries() final GetAccountsRequestParams params,
  );

  @POST(EndPoints.createAccount)
  Future<GetAccountItemResponseModel?> createAccount(
    @Body() final CreateAccountRequestParams params,
  );

  @GET(EndPoints.getCurrencies)
  Future<GetCurrenciesResponseModel?> getCurrencies(
    @Queries() final GetCurrenciesRequestParams params,
  );
}
