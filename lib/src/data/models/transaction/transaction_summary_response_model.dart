import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import 'transaction_summary_model.dart';

part 'transaction_summary_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionSummaryResponseModel extends GeneralResponseModel {
  TransactionSummaryResponseModel({
    this.data,
  });

  factory TransactionSummaryResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$TransactionSummaryResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final TransactionSummaryModel? data;
}
