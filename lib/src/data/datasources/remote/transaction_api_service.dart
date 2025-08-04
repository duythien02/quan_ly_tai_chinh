import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../core/params/params.dart';
import '../../../data/models/models.dart';
import '../../models/transaction/transaction_create_response_model.dart';

part 'transaction_api_service.g.dart';

@RestApi()
abstract class TransactionApiService {
  factory TransactionApiService(final Dio dio, {final String baseUrl}) =
      _TransactionApiService;

  @GET(EndPoints.getTransactionSummary)
  Future<TransactionSummaryResponseModel> getTransactionSummary(
    @Queries() final GetTransactionSummaryRequestParams params,
  );

  @POST(EndPoints.createTransaction)
  Future<TransactionCreateResponseModel> createTransaction(
    @Body() final CreateTransactionRequestParams params,
  );
}
