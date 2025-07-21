// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
