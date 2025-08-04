// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserProfileResponseModel _$GetUserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserProfileResponseModel(
      data: json['data'] == null || json['data'] is! Map
          ? null
          : UserProfileModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = double.tryParse(json['status'].toString())?.toInt()
      ..code = json['code']?.toString()
      ..message = json['message']?.toString();
