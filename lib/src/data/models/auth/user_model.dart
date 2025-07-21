import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; // Generated code

@JsonSerializable()
class UserModel {
  UserModel({
    this.username,
    this.userId,
    this.email,
    this.accessToken,
    this.hasAccount,
    this.refreshToken,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'userId')
  final String? userId;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  @JsonKey(name: 'hasAccount')
  final bool? hasAccount;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
