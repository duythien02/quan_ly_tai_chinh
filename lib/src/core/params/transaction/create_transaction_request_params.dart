import 'package:dart_mappable/dart_mappable.dart';

part 'create_transaction_request_params.mapper.dart';

@MappableClass()
class CreateTransactionRequestParams
    with CreateTransactionRequestParamsMappable {
  const CreateTransactionRequestParams({
    required this.amount,
    required this.categoryId,
    required this.accountId,
    required this.date,
    required this.description,
    required this.type,
  });

  final double amount;
  final String categoryId;
  final String accountId;
  final String date;
  final String description;
  final String type;
}
