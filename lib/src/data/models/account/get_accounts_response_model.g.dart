// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_accounts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountsResponseModel _$GetAccountsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAccountsResponseModel(
      data: AccountModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
