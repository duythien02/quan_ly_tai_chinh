// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_request_params.dart';

class LoginRequestParamsMapper extends ClassMapperBase<LoginRequestParams> {
  LoginRequestParamsMapper._();

  static LoginRequestParamsMapper? _instance;
  static LoginRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginRequestParams';

  static String _$username(LoginRequestParams v) => v.username;
  static const Field<LoginRequestParams, String> _f$username =
      Field('username', _$username);
  static String _$password(LoginRequestParams v) => v.password;
  static const Field<LoginRequestParams, String> _f$password =
      Field('password', _$password);

  @override
  final MappableFields<LoginRequestParams> fields = const {
    #username: _f$username,
    #password: _f$password,
  };
  @override
  final bool ignoreNull = true;

  static LoginRequestParams _instantiate(DecodingData data) {
    return LoginRequestParams(
        username: data.dec(_f$username), password: data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginRequestParams>(map);
  }

  static LoginRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<LoginRequestParams>(json);
  }
}

mixin LoginRequestParamsMappable {
  String serialize() {
    return LoginRequestParamsMapper.ensureInitialized()
        .encodeJson<LoginRequestParams>(this as LoginRequestParams);
  }

  Map<String, dynamic> toJson() {
    return LoginRequestParamsMapper.ensureInitialized()
        .encodeMap<LoginRequestParams>(this as LoginRequestParams);
  }

  LoginRequestParamsCopyWith<LoginRequestParams, LoginRequestParams,
          LoginRequestParams>
      get copyWith => _LoginRequestParamsCopyWithImpl(
          this as LoginRequestParams, $identity, $identity);
  @override
  String toString() {
    return LoginRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as LoginRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return LoginRequestParamsMapper.ensureInitialized()
        .equalsValue(this as LoginRequestParams, other);
  }

  @override
  int get hashCode {
    return LoginRequestParamsMapper.ensureInitialized()
        .hashValue(this as LoginRequestParams);
  }
}

extension LoginRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginRequestParams, $Out> {
  LoginRequestParamsCopyWith<$R, LoginRequestParams, $Out>
      get $asLoginRequestParams =>
          $base.as((v, t, t2) => _LoginRequestParamsCopyWithImpl(v, t, t2));
}

abstract class LoginRequestParamsCopyWith<$R, $In extends LoginRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? password});
  LoginRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoginRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginRequestParams, $Out>
    implements LoginRequestParamsCopyWith<$R, LoginRequestParams, $Out> {
  _LoginRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginRequestParams> $mapper =
      LoginRequestParamsMapper.ensureInitialized();
  @override
  $R call({String? username, String? password}) => $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (password != null) #password: password
      }));
  @override
  LoginRequestParams $make(CopyWithData data) => LoginRequestParams(
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password));

  @override
  LoginRequestParamsCopyWith<$R2, LoginRequestParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginRequestParamsCopyWithImpl($value, $cast, t);
}
