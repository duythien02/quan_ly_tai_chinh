// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_create_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionCreateResponseModel _$TransactionCreateResponseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionCreateResponseModel()
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
