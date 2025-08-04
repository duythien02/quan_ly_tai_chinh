import 'package:json_annotation/json_annotation.dart';

part 'transaction_summary_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionSummaryModel {
  TransactionSummaryModel({
    required this.items,
  });

  factory TransactionSummaryModel.fromJson(final Map<String, dynamic> json) =>
      _$TransactionSummaryModelFromJson(json);

  @JsonKey(name: 'items')
  final List<TransactionSummaryDocsModel?> items;
}

@JsonSerializable()
class TransactionSummaryDocsModel {
  TransactionSummaryDocsModel({
    this.date,
    this.totalExpense,
    this.totalIncome,
  });

  factory TransactionSummaryDocsModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$TransactionSummaryDocsModelFromJson(json);

  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'total_expense')
  final double? totalExpense;

  @JsonKey(name: 'total_income')
  final double? totalIncome;

  Map<String, dynamic> toJson() => _$TransactionSummaryDocsModelToJson(this);
}
