// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSummaryModel _$TransactionSummaryModelFromJson(
        Map<String, dynamic> json) =>
    TransactionSummaryModel(
      items: (json['items'] is List)
          ? (json['items'] as List<dynamic>)
              .map((e) => e == null || e is! Map
                  ? null
                  : TransactionSummaryDocsModel.fromJson(
                      e as Map<String, dynamic>))
              .toList()
          : [],
    );

TransactionSummaryDocsModel _$TransactionSummaryDocsModelFromJson(
        Map<String, dynamic> json) =>
    TransactionSummaryDocsModel(
      date: json['date']?.toString(),
      totalExpense: double.tryParse(json['total_expense'].toString()),
      totalIncome: double.tryParse(json['total_income'].toString()),
    );

Map<String, dynamic> _$TransactionSummaryDocsModelToJson(
    TransactionSummaryDocsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  writeNotNull('total_expense', instance.totalExpense);
  writeNotNull('total_income', instance.totalIncome);
  return val;
}
