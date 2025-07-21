// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountItemResponseModel _$GetAccountItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAccountItemResponseModel(
      data: AccountDocsModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
