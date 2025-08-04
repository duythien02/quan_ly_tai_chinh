// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_user_profile_request_params.dart';

class GetUserProfileRequestParamsMapper
    extends ClassMapperBase<GetUserProfileRequestParams> {
  GetUserProfileRequestParamsMapper._();

  static GetUserProfileRequestParamsMapper? _instance;
  static GetUserProfileRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GetUserProfileRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetUserProfileRequestParams';

  @override
  final MappableFields<GetUserProfileRequestParams> fields = const {};
  @override
  final bool ignoreNull = true;

  static GetUserProfileRequestParams _instantiate(DecodingData data) {
    return GetUserProfileRequestParams();
  }

  @override
  final Function instantiate = _instantiate;

  static GetUserProfileRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetUserProfileRequestParams>(map);
  }

  static GetUserProfileRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<GetUserProfileRequestParams>(json);
  }
}

mixin GetUserProfileRequestParamsMappable {
  String serialize() {
    return GetUserProfileRequestParamsMapper.ensureInitialized()
        .encodeJson<GetUserProfileRequestParams>(
            this as GetUserProfileRequestParams);
  }

  Map<String, dynamic> toJson() {
    return GetUserProfileRequestParamsMapper.ensureInitialized()
        .encodeMap<GetUserProfileRequestParams>(
            this as GetUserProfileRequestParams);
  }

  GetUserProfileRequestParamsCopyWith<GetUserProfileRequestParams,
          GetUserProfileRequestParams, GetUserProfileRequestParams>
      get copyWith => _GetUserProfileRequestParamsCopyWithImpl(
          this as GetUserProfileRequestParams, $identity, $identity);
  @override
  String toString() {
    return GetUserProfileRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as GetUserProfileRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return GetUserProfileRequestParamsMapper.ensureInitialized()
        .equalsValue(this as GetUserProfileRequestParams, other);
  }

  @override
  int get hashCode {
    return GetUserProfileRequestParamsMapper.ensureInitialized()
        .hashValue(this as GetUserProfileRequestParams);
  }
}

extension GetUserProfileRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetUserProfileRequestParams, $Out> {
  GetUserProfileRequestParamsCopyWith<$R, GetUserProfileRequestParams, $Out>
      get $asGetUserProfileRequestParams => $base
          .as((v, t, t2) => _GetUserProfileRequestParamsCopyWithImpl(v, t, t2));
}

abstract class GetUserProfileRequestParamsCopyWith<
    $R,
    $In extends GetUserProfileRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GetUserProfileRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetUserProfileRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetUserProfileRequestParams, $Out>
    implements
        GetUserProfileRequestParamsCopyWith<$R, GetUserProfileRequestParams,
            $Out> {
  _GetUserProfileRequestParamsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetUserProfileRequestParams> $mapper =
      GetUserProfileRequestParamsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GetUserProfileRequestParams $make(CopyWithData data) =>
      GetUserProfileRequestParams();

  @override
  GetUserProfileRequestParamsCopyWith<$R2, GetUserProfileRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetUserProfileRequestParamsCopyWithImpl($value, $cast, t);
}
