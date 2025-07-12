// Package imports:
import 'package:dart_mappable/dart_mappable.dart';

part 'login_request_params.mapper.dart'; // Sẽ được generate bởi build_runner

@MappableClass()
class LoginRequestParams with LoginRequestParamsMappable {
  LoginRequestParams({
    required this.username,
    required this.password,
  });

  @MappableField(key: 'username')
  final String username;
  @MappableField(key: 'password')
  final String password;
}
