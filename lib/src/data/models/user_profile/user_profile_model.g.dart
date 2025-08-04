// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: json['id']?.toString(),
      username: json['username']?.toString(),
      email: json['email']?.toString(),
      avatar: json['avatar']?.toString(),
      createAt: json['createAt']?.toString(),
      updateAt: json['updateAt']?.toString(),
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('createAt', instance.createAt);
  writeNotNull('updateAt', instance.updateAt);
  return val;
}
