// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponseModel _$GetCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesResponseModel(
      data: json['data'] == null || json['data'] is! Map
          ? null
          : CategoryModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
