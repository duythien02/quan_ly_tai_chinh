import 'package:dart_mappable/dart_mappable.dart';

part 'get_transaction_summary_request_params.mapper.dart';

@MappableClass()
class GetTransactionSummaryRequestParams
    with GetTransactionSummaryRequestParamsMappable {
  GetTransactionSummaryRequestParams({
    this.startDate,
    this.endDate,
    this.accountId,
  });

  @MappableField(key: 'account_id')
  final String? accountId;

  @MappableField(key: 'start_date')
  final String? startDate;

  @MappableField(key: 'end_date')
  final String? endDate;
}
