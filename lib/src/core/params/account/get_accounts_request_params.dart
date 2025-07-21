import 'package:dart_mappable/dart_mappable.dart';
part 'get_accounts_request_params.mapper.dart';

@MappableClass()
class GetAccountsRequestParams with GetAccountsRequestParamsMappable {
  GetAccountsRequestParams({
    this.limit = 10,
    this.page = 1,
  });

  @MappableField(key: 'limit')
  final int limit;

  @MappableField(key: 'page')
  final int page;
}
