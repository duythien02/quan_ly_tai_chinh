// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponseModel _$GeneralResponseModelFromJson(
        Map<String, dynamic> json) =>
    GeneralResponseModel(
      status: double.tryParse(json['status'].toString())?.toInt(),
      code: json['code']?.toString(),
      message: json['message']?.toString(),
    );
