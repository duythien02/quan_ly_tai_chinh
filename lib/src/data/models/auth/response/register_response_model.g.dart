// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseModel(
      data: RegisterModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
