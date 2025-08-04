import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  UserProfileModel({
    this.id,
    this.username,
    this.email,
    this.avatar,
    this.createAt,
    this.updateAt,
  });

  factory UserProfileModel.fromJson(final Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'createAt')
  final String? createAt;

  @JsonKey(name: 'updateAt')
  final String? updateAt;

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}
