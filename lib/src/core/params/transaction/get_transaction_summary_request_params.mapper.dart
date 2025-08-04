// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_transaction_summary_request_params.dart';

class GetTransactionSummaryRequestParamsMapper
    extends ClassMapperBase<GetTransactionSummaryRequestParams> {
  GetTransactionSummaryRequestParamsMapper._();

  static GetTransactionSummaryRequestParamsMapper? _instance;
  static GetTransactionSummaryRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GetTransactionSummaryRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetTransactionSummaryRequestParams';

  static String? _$startDate(GetTransactionSummaryRequestParams v) =>
      v.startDate;
  static const Field<GetTransactionSummaryRequestParams, String> _f$startDate =
      Field('startDate', _$startDate, key: r'start_date', opt: true);
  static String? _$endDate(GetTransactionSummaryRequestParams v) => v.endDate;
  static const Field<GetTransactionSummaryRequestParams, String> _f$endDate =
      Field('endDate', _$endDate, key: r'end_date', opt: true);
  static String? _$accountId(GetTransactionSummaryRequestParams v) =>
      v.accountId;
  static const Field<GetTransactionSummaryRequestParams, String> _f$accountId =
      Field('accountId', _$accountId, key: r'account_id', opt: true);

  @override
  final MappableFields<GetTransactionSummaryRequestParams> fields = const {
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #accountId: _f$accountId,
  };
  @override
  final bool ignoreNull = true;

  static GetTransactionSummaryRequestParams _instantiate(DecodingData data) {
    return GetTransactionSummaryRequestParams(
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        accountId: data.dec(_f$accountId));
  }

  @override
  final Function instantiate = _instantiate;

  static GetTransactionSummaryRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<GetTransactionSummaryRequestParams>(map);
  }

  static GetTransactionSummaryRequestParams deserialize(String json) {
    return ensureInitialized()
        .decodeJson<GetTransactionSummaryRequestParams>(json);
  }
}

mixin GetTransactionSummaryRequestParamsMappable {
  String serialize() {
    return GetTransactionSummaryRequestParamsMapper.ensureInitialized()
        .encodeJson<GetTransactionSummaryRequestParams>(
            this as GetTransactionSummaryRequestParams);
  }

  Map<String, dynamic> toJson() {
    return GetTransactionSummaryRequestParamsMapper.ensureInitialized()
        .encodeMap<GetTransactionSummaryRequestParams>(
            this as GetTransactionSummaryRequestParams);
  }

  GetTransactionSummaryRequestParamsCopyWith<
          GetTransactionSummaryRequestParams,
          GetTransactionSummaryRequestParams,
          GetTransactionSummaryRequestParams>
      get copyWith => _GetTransactionSummaryRequestParamsCopyWithImpl(
          this as GetTransactionSummaryRequestParams, $identity, $identity);
  @override
  String toString() {
    return GetTransactionSummaryRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as GetTransactionSummaryRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return GetTransactionSummaryRequestParamsMapper.ensureInitialized()
        .equalsValue(this as GetTransactionSummaryRequestParams, other);
  }

  @override
  int get hashCode {
    return GetTransactionSummaryRequestParamsMapper.ensureInitialized()
        .hashValue(this as GetTransactionSummaryRequestParams);
  }
}

extension GetTransactionSummaryRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetTransactionSummaryRequestParams, $Out> {
  GetTransactionSummaryRequestParamsCopyWith<$R,
          GetTransactionSummaryRequestParams, $Out>
      get $asGetTransactionSummaryRequestParams => $base.as((v, t, t2) =>
          _GetTransactionSummaryRequestParamsCopyWithImpl(v, t, t2));
}

abstract class GetTransactionSummaryRequestParamsCopyWith<
    $R,
    $In extends GetTransactionSummaryRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? startDate, String? endDate, String? accountId});
  GetTransactionSummaryRequestParamsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GetTransactionSummaryRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetTransactionSummaryRequestParams, $Out>
    implements
        GetTransactionSummaryRequestParamsCopyWith<$R,
            GetTransactionSummaryRequestParams, $Out> {
  _GetTransactionSummaryRequestParamsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetTransactionSummaryRequestParams> $mapper =
      GetTransactionSummaryRequestParamsMapper.ensureInitialized();
  @override
  $R call(
          {Object? startDate = $none,
          Object? endDate = $none,
          Object? accountId = $none}) =>
      $apply(FieldCopyWithData({
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (accountId != $none) #accountId: accountId
      }));
  @override
  GetTransactionSummaryRequestParams $make(CopyWithData data) =>
      GetTransactionSummaryRequestParams(
          startDate: data.get(#startDate, or: $value.startDate),
          endDate: data.get(#endDate, or: $value.endDate),
          accountId: data.get(#accountId, or: $value.accountId));

  @override
  GetTransactionSummaryRequestParamsCopyWith<$R2,
      GetTransactionSummaryRequestParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GetTransactionSummaryRequestParamsCopyWithImpl($value, $cast, t);
}
