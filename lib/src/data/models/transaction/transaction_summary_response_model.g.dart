// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_summary_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSummaryResponseModel _$TransactionSummaryResponseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionSummaryResponseModel(
      data: json['data'] == null || json['data'] is! Map
          ? null
          : TransactionSummaryModel.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
