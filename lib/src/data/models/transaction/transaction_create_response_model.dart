import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';

part 'transaction_create_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionCreateResponseModel extends GeneralResponseModel {
  TransactionCreateResponseModel();

  factory TransactionCreateResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$TransactionCreateResponseModelFromJson(json);
}
