import 'package:dart_mappable/dart_mappable.dart';
part 'create_account_request_params.mapper.dart';

@MappableClass()
class CreateAccountRequestParams with CreateAccountRequestParamsMappable {
  CreateAccountRequestParams({
    required this.accountName,
    required this.currencyCode,
    required this.initialBalance,
  });
  @MappableField(key: 'accountName')
  final String accountName;

  @MappableField(key: 'currencyCode')
  final String currencyCode;

  @MappableField(key: 'initialBalance')
  final double initialBalance;
}
