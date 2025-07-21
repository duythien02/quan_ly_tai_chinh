// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrenciesResponseModel _$GetCurrenciesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCurrenciesResponseModel(
      data: CurrencyModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
