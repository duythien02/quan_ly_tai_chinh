import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart'; // Generated code

@JsonSerializable()
class AuthModel {
  AuthModel({
    this.userId,
    this.accessToken,
    this.hasAccounts,
    this.refreshToken,
  });

  factory AuthModel.fromJson(final Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  @JsonKey(name: 'userId')
  final String? userId;

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  @JsonKey(name: 'hasAccounts')
  final bool? hasAccounts;

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
