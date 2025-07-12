// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_request_params.dart';

class RegisterRequestParamsMapper
    extends ClassMapperBase<RegisterRequestParams> {
  RegisterRequestParamsMapper._();

  static RegisterRequestParamsMapper? _instance;
  static RegisterRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterRequestParams';

  static String _$username(RegisterRequestParams v) => v.username;
  static const Field<RegisterRequestParams, String> _f$username =
      Field('username', _$username);
  static String _$password(RegisterRequestParams v) => v.password;
  static const Field<RegisterRequestParams, String> _f$password =
      Field('password', _$password);
  static String _$email(RegisterRequestParams v) => v.email;
  static const Field<RegisterRequestParams, String> _f$email =
      Field('email', _$email);

  @override
  final MappableFields<RegisterRequestParams> fields = const {
    #username: _f$username,
    #password: _f$password,
    #email: _f$email,
  };
  @override
  final bool ignoreNull = true;

  static RegisterRequestParams _instantiate(DecodingData data) {
    return RegisterRequestParams(
        username: data.dec(_f$username),
        password: data.dec(_f$password),
        email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterRequestParams>(map);
  }

  static RegisterRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<RegisterRequestParams>(json);
  }
}

mixin RegisterRequestParamsMappable {
  String serialize() {
    return RegisterRequestParamsMapper.ensureInitialized()
        .encodeJson<RegisterRequestParams>(this as RegisterRequestParams);
  }

  Map<String, dynamic> toJson() {
    return RegisterRequestParamsMapper.ensureInitialized()
        .encodeMap<RegisterRequestParams>(this as RegisterRequestParams);
  }

  RegisterRequestParamsCopyWith<RegisterRequestParams, RegisterRequestParams,
          RegisterRequestParams>
      get copyWith => _RegisterRequestParamsCopyWithImpl(
          this as RegisterRequestParams, $identity, $identity);
  @override
  String toString() {
    return RegisterRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as RegisterRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return RegisterRequestParamsMapper.ensureInitialized()
        .equalsValue(this as RegisterRequestParams, other);
  }

  @override
  int get hashCode {
    return RegisterRequestParamsMapper.ensureInitialized()
        .hashValue(this as RegisterRequestParams);
  }
}

extension RegisterRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterRequestParams, $Out> {
  RegisterRequestParamsCopyWith<$R, RegisterRequestParams, $Out>
      get $asRegisterRequestParams =>
          $base.as((v, t, t2) => _RegisterRequestParamsCopyWithImpl(v, t, t2));
}

abstract class RegisterRequestParamsCopyWith<
    $R,
    $In extends RegisterRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? password, String? email});
  RegisterRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RegisterRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterRequestParams, $Out>
    implements RegisterRequestParamsCopyWith<$R, RegisterRequestParams, $Out> {
  _RegisterRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterRequestParams> $mapper =
      RegisterRequestParamsMapper.ensureInitialized();
  @override
  $R call({String? username, String? password, String? email}) =>
      $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (password != null) #password: password,
        if (email != null) #email: email
      }));
  @override
  RegisterRequestParams $make(CopyWithData data) => RegisterRequestParams(
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password),
      email: data.get(#email, or: $value.email));

  @override
  RegisterRequestParamsCopyWith<$R2, RegisterRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _RegisterRequestParamsCopyWithImpl($value, $cast, t);
}
