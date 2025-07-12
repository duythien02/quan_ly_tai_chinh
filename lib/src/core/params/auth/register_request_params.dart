// lib/src/data/models/auth/register_request_params.dart
// Package imports:
import 'package:dart_mappable/dart_mappable.dart';

part 'register_request_params.mapper.dart'; // Sẽ được generate bởi build_runner

@MappableClass()
class RegisterRequestParams with RegisterRequestParamsMappable {
  RegisterRequestParams({
    required this.username,
    required this.password,
    required this.email,
  });

  @MappableField(key: 'username')
  final String username;

  @MappableField(key: 'password')
  final String password;

  @MappableField(key: 'email')
  final String email;
}
