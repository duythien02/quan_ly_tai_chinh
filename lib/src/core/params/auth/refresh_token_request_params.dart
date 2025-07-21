import 'package:dart_mappable/dart_mappable.dart';

part 'refresh_token_request_params.mapper.dart';

@MappableClass()
class RefreshTokenRequestParams with RefreshTokenRequestParamsMappable {
  const RefreshTokenRequestParams({required this.refreshToken});

  @MappableField(key: 'refreshToken')
  final String refreshToken;
}
