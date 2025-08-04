// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      userId: json['userId']?.toString(),
      accessToken: json['accessToken']?.toString(),
      hasAccounts: bool.tryParse(json['hasAccounts'].toString()),
      refreshToken: json['refreshToken']?.toString(),
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('refreshToken', instance.refreshToken);
  writeNotNull('hasAccounts', instance.hasAccounts);
  return val;
}
