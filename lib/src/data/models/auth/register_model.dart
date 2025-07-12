import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart'; // Generated code

@JsonSerializable()
class RegisterModel {
  RegisterModel({
    required this.username,
    required this.password,
    required this.email,
    required this.token,
  });

  factory RegisterModel.fromJson(final Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'token')
  final String token;

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
