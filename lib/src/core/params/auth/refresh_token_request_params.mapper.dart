// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'refresh_token_request_params.dart';

class RefreshTokenRequestParamsMapper
    extends ClassMapperBase<RefreshTokenRequestParams> {
  RefreshTokenRequestParamsMapper._();

  static RefreshTokenRequestParamsMapper? _instance;
  static RefreshTokenRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = RefreshTokenRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RefreshTokenRequestParams';

  static String _$refreshToken(RefreshTokenRequestParams v) => v.refreshToken;
  static const Field<RefreshTokenRequestParams, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken);

  @override
  final MappableFields<RefreshTokenRequestParams> fields = const {
    #refreshToken: _f$refreshToken,
  };
  @override
  final bool ignoreNull = true;

  static RefreshTokenRequestParams _instantiate(DecodingData data) {
    return RefreshTokenRequestParams(refreshToken: data.dec(_f$refreshToken));
  }

  @override
  final Function instantiate = _instantiate;

  static RefreshTokenRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RefreshTokenRequestParams>(map);
  }

  static RefreshTokenRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<RefreshTokenRequestParams>(json);
  }
}

mixin RefreshTokenRequestParamsMappable {
  String serialize() {
    return RefreshTokenRequestParamsMapper.ensureInitialized()
        .encodeJson<RefreshTokenRequestParams>(
            this as RefreshTokenRequestParams);
  }

  Map<String, dynamic> toJson() {
    return RefreshTokenRequestParamsMapper.ensureInitialized()
        .encodeMap<RefreshTokenRequestParams>(
            this as RefreshTokenRequestParams);
  }

  RefreshTokenRequestParamsCopyWith<RefreshTokenRequestParams,
          RefreshTokenRequestParams, RefreshTokenRequestParams>
      get copyWith => _RefreshTokenRequestParamsCopyWithImpl(
          this as RefreshTokenRequestParams, $identity, $identity);
  @override
  String toString() {
    return RefreshTokenRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as RefreshTokenRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return RefreshTokenRequestParamsMapper.ensureInitialized()
        .equalsValue(this as RefreshTokenRequestParams, other);
  }

  @override
  int get hashCode {
    return RefreshTokenRequestParamsMapper.ensureInitialized()
        .hashValue(this as RefreshTokenRequestParams);
  }
}

extension RefreshTokenRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RefreshTokenRequestParams, $Out> {
  RefreshTokenRequestParamsCopyWith<$R, RefreshTokenRequestParams, $Out>
      get $asRefreshTokenRequestParams => $base
          .as((v, t, t2) => _RefreshTokenRequestParamsCopyWithImpl(v, t, t2));
}

abstract class RefreshTokenRequestParamsCopyWith<
    $R,
    $In extends RefreshTokenRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? refreshToken});
  RefreshTokenRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RefreshTokenRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RefreshTokenRequestParams, $Out>
    implements
        RefreshTokenRequestParamsCopyWith<$R, RefreshTokenRequestParams, $Out> {
  _RefreshTokenRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RefreshTokenRequestParams> $mapper =
      RefreshTokenRequestParamsMapper.ensureInitialized();
  @override
  $R call({String? refreshToken}) => $apply(FieldCopyWithData(
      {if (refreshToken != null) #refreshToken: refreshToken}));
  @override
  RefreshTokenRequestParams $make(CopyWithData data) =>
      RefreshTokenRequestParams(
          refreshToken: data.get(#refreshToken, or: $value.refreshToken));

  @override
  RefreshTokenRequestParamsCopyWith<$R2, RefreshTokenRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _RefreshTokenRequestParamsCopyWithImpl($value, $cast, t);
}
