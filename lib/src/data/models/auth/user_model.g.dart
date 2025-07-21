// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username']?.toString(),
      userId: json['userId']?.toString(),
      email: json['email']?.toString(),
      accessToken: json['accessToken']?.toString(),
      hasAccount: bool.tryParse(json['hasAccount'].toString()),
      refreshToken: json['refreshToken']?.toString(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('userId', instance.userId);
  writeNotNull('email', instance.email);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('refreshToken', instance.refreshToken);
  writeNotNull('hasAccount', instance.hasAccount);
  return val;
}
