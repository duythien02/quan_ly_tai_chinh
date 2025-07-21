// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_currencies_request_params.dart';

class GetCurrenciesRequestParamsMapper
    extends ClassMapperBase<GetCurrenciesRequestParams> {
  GetCurrenciesRequestParamsMapper._();

  static GetCurrenciesRequestParamsMapper? _instance;
  static GetCurrenciesRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GetCurrenciesRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetCurrenciesRequestParams';

  @override
  final MappableFields<GetCurrenciesRequestParams> fields = const {};
  @override
  final bool ignoreNull = true;

  static GetCurrenciesRequestParams _instantiate(DecodingData data) {
    return GetCurrenciesRequestParams();
  }

  @override
  final Function instantiate = _instantiate;

  static GetCurrenciesRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetCurrenciesRequestParams>(map);
  }

  static GetCurrenciesRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<GetCurrenciesRequestParams>(json);
  }
}

mixin GetCurrenciesRequestParamsMappable {
  String serialize() {
    return GetCurrenciesRequestParamsMapper.ensureInitialized()
        .encodeJson<GetCurrenciesRequestParams>(
            this as GetCurrenciesRequestParams);
  }

  Map<String, dynamic> toJson() {
    return GetCurrenciesRequestParamsMapper.ensureInitialized()
        .encodeMap<GetCurrenciesRequestParams>(
            this as GetCurrenciesRequestParams);
  }

  GetCurrenciesRequestParamsCopyWith<GetCurrenciesRequestParams,
          GetCurrenciesRequestParams, GetCurrenciesRequestParams>
      get copyWith => _GetCurrenciesRequestParamsCopyWithImpl(
          this as GetCurrenciesRequestParams, $identity, $identity);
  @override
  String toString() {
    return GetCurrenciesRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as GetCurrenciesRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return GetCurrenciesRequestParamsMapper.ensureInitialized()
        .equalsValue(this as GetCurrenciesRequestParams, other);
  }

  @override
  int get hashCode {
    return GetCurrenciesRequestParamsMapper.ensureInitialized()
        .hashValue(this as GetCurrenciesRequestParams);
  }
}

extension GetCurrenciesRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetCurrenciesRequestParams, $Out> {
  GetCurrenciesRequestParamsCopyWith<$R, GetCurrenciesRequestParams, $Out>
      get $asGetCurrenciesRequestParams => $base
          .as((v, t, t2) => _GetCurrenciesRequestParamsCopyWithImpl(v, t, t2));
}

abstract class GetCurrenciesRequestParamsCopyWith<
    $R,
    $In extends GetCurrenciesRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GetCurrenciesRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetCurrenciesRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetCurrenciesRequestParams, $Out>
    implements
        GetCurrenciesRequestParamsCopyWith<$R, GetCurrenciesRequestParams,
            $Out> {
  _GetCurrenciesRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetCurrenciesRequestParams> $mapper =
      GetCurrenciesRequestParamsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GetCurrenciesRequestParams $make(CopyWithData data) =>
      GetCurrenciesRequestParams();

  @override
  GetCurrenciesRequestParamsCopyWith<$R2, GetCurrenciesRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetCurrenciesRequestParamsCopyWithImpl($value, $cast, t);
}
