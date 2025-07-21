// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_accounts_request_params.dart';

class GetAccountsRequestParamsMapper
    extends ClassMapperBase<GetAccountsRequestParams> {
  GetAccountsRequestParamsMapper._();

  static GetAccountsRequestParamsMapper? _instance;
  static GetAccountsRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GetAccountsRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetAccountsRequestParams';

  static int _$limit(GetAccountsRequestParams v) => v.limit;
  static const Field<GetAccountsRequestParams, int> _f$limit =
      Field('limit', _$limit, opt: true, def: 10);
  static int _$page(GetAccountsRequestParams v) => v.page;
  static const Field<GetAccountsRequestParams, int> _f$page =
      Field('page', _$page, opt: true, def: 1);

  @override
  final MappableFields<GetAccountsRequestParams> fields = const {
    #limit: _f$limit,
    #page: _f$page,
  };
  @override
  final bool ignoreNull = true;

  static GetAccountsRequestParams _instantiate(DecodingData data) {
    return GetAccountsRequestParams(
        limit: data.dec(_f$limit), page: data.dec(_f$page));
  }

  @override
  final Function instantiate = _instantiate;

  static GetAccountsRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetAccountsRequestParams>(map);
  }

  static GetAccountsRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<GetAccountsRequestParams>(json);
  }
}

mixin GetAccountsRequestParamsMappable {
  String serialize() {
    return GetAccountsRequestParamsMapper.ensureInitialized()
        .encodeJson<GetAccountsRequestParams>(this as GetAccountsRequestParams);
  }

  Map<String, dynamic> toJson() {
    return GetAccountsRequestParamsMapper.ensureInitialized()
        .encodeMap<GetAccountsRequestParams>(this as GetAccountsRequestParams);
  }

  GetAccountsRequestParamsCopyWith<GetAccountsRequestParams,
          GetAccountsRequestParams, GetAccountsRequestParams>
      get copyWith => _GetAccountsRequestParamsCopyWithImpl(
          this as GetAccountsRequestParams, $identity, $identity);
  @override
  String toString() {
    return GetAccountsRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as GetAccountsRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return GetAccountsRequestParamsMapper.ensureInitialized()
        .equalsValue(this as GetAccountsRequestParams, other);
  }

  @override
  int get hashCode {
    return GetAccountsRequestParamsMapper.ensureInitialized()
        .hashValue(this as GetAccountsRequestParams);
  }
}

extension GetAccountsRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetAccountsRequestParams, $Out> {
  GetAccountsRequestParamsCopyWith<$R, GetAccountsRequestParams, $Out>
      get $asGetAccountsRequestParams => $base
          .as((v, t, t2) => _GetAccountsRequestParamsCopyWithImpl(v, t, t2));
}

abstract class GetAccountsRequestParamsCopyWith<
    $R,
    $In extends GetAccountsRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? limit, int? page});
  GetAccountsRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetAccountsRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetAccountsRequestParams, $Out>
    implements
        GetAccountsRequestParamsCopyWith<$R, GetAccountsRequestParams, $Out> {
  _GetAccountsRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetAccountsRequestParams> $mapper =
      GetAccountsRequestParamsMapper.ensureInitialized();
  @override
  $R call({int? limit, int? page}) => $apply(FieldCopyWithData(
      {if (limit != null) #limit: limit, if (page != null) #page: page}));
  @override
  GetAccountsRequestParams $make(CopyWithData data) => GetAccountsRequestParams(
      limit: data.get(#limit, or: $value.limit),
      page: data.get(#page, or: $value.page));

  @override
  GetAccountsRequestParamsCopyWith<$R2, GetAccountsRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetAccountsRequestParamsCopyWithImpl($value, $cast, t);
}
