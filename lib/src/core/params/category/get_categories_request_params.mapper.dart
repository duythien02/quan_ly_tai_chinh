// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_categories_request_params.dart';

class GetCategoriesRequestParamsMapper
    extends ClassMapperBase<GetCategoriesRequestParams> {
  GetCategoriesRequestParamsMapper._();

  static GetCategoriesRequestParamsMapper? _instance;
  static GetCategoriesRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GetCategoriesRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetCategoriesRequestParams';

  @override
  final MappableFields<GetCategoriesRequestParams> fields = const {};
  @override
  final bool ignoreNull = true;

  static GetCategoriesRequestParams _instantiate(DecodingData data) {
    return GetCategoriesRequestParams();
  }

  @override
  final Function instantiate = _instantiate;

  static GetCategoriesRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetCategoriesRequestParams>(map);
  }

  static GetCategoriesRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<GetCategoriesRequestParams>(json);
  }
}

mixin GetCategoriesRequestParamsMappable {
  String serialize() {
    return GetCategoriesRequestParamsMapper.ensureInitialized()
        .encodeJson<GetCategoriesRequestParams>(
            this as GetCategoriesRequestParams);
  }

  Map<String, dynamic> toJson() {
    return GetCategoriesRequestParamsMapper.ensureInitialized()
        .encodeMap<GetCategoriesRequestParams>(
            this as GetCategoriesRequestParams);
  }

  GetCategoriesRequestParamsCopyWith<GetCategoriesRequestParams,
          GetCategoriesRequestParams, GetCategoriesRequestParams>
      get copyWith => _GetCategoriesRequestParamsCopyWithImpl(
          this as GetCategoriesRequestParams, $identity, $identity);
  @override
  String toString() {
    return GetCategoriesRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as GetCategoriesRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return GetCategoriesRequestParamsMapper.ensureInitialized()
        .equalsValue(this as GetCategoriesRequestParams, other);
  }

  @override
  int get hashCode {
    return GetCategoriesRequestParamsMapper.ensureInitialized()
        .hashValue(this as GetCategoriesRequestParams);
  }
}

extension GetCategoriesRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetCategoriesRequestParams, $Out> {
  GetCategoriesRequestParamsCopyWith<$R, GetCategoriesRequestParams, $Out>
      get $asGetCategoriesRequestParams => $base
          .as((v, t, t2) => _GetCategoriesRequestParamsCopyWithImpl(v, t, t2));
}

abstract class GetCategoriesRequestParamsCopyWith<
    $R,
    $In extends GetCategoriesRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GetCategoriesRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetCategoriesRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetCategoriesRequestParams, $Out>
    implements
        GetCategoriesRequestParamsCopyWith<$R, GetCategoriesRequestParams,
            $Out> {
  _GetCategoriesRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetCategoriesRequestParams> $mapper =
      GetCategoriesRequestParamsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GetCategoriesRequestParams $make(CopyWithData data) =>
      GetCategoriesRequestParams();

  @override
  GetCategoriesRequestParamsCopyWith<$R2, GetCategoriesRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetCategoriesRequestParamsCopyWithImpl($value, $cast, t);
}
