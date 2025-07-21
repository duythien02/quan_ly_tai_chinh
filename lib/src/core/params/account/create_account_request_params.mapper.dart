// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_account_request_params.dart';

class CreateAccountRequestParamsMapper
    extends ClassMapperBase<CreateAccountRequestParams> {
  CreateAccountRequestParamsMapper._();

  static CreateAccountRequestParamsMapper? _instance;
  static CreateAccountRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CreateAccountRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateAccountRequestParams';

  static String _$accountName(CreateAccountRequestParams v) => v.accountName;
  static const Field<CreateAccountRequestParams, String> _f$accountName =
      Field('accountName', _$accountName);
  static String _$currencyCode(CreateAccountRequestParams v) => v.currencyCode;
  static const Field<CreateAccountRequestParams, String> _f$currencyCode =
      Field('currencyCode', _$currencyCode);
  static double _$initialBalance(CreateAccountRequestParams v) =>
      v.initialBalance;
  static const Field<CreateAccountRequestParams, double> _f$initialBalance =
      Field('initialBalance', _$initialBalance);

  @override
  final MappableFields<CreateAccountRequestParams> fields = const {
    #accountName: _f$accountName,
    #currencyCode: _f$currencyCode,
    #initialBalance: _f$initialBalance,
  };
  @override
  final bool ignoreNull = true;

  static CreateAccountRequestParams _instantiate(DecodingData data) {
    return CreateAccountRequestParams(
        accountName: data.dec(_f$accountName),
        currencyCode: data.dec(_f$currencyCode),
        initialBalance: data.dec(_f$initialBalance));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateAccountRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateAccountRequestParams>(map);
  }

  static CreateAccountRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<CreateAccountRequestParams>(json);
  }
}

mixin CreateAccountRequestParamsMappable {
  String serialize() {
    return CreateAccountRequestParamsMapper.ensureInitialized()
        .encodeJson<CreateAccountRequestParams>(
            this as CreateAccountRequestParams);
  }

  Map<String, dynamic> toJson() {
    return CreateAccountRequestParamsMapper.ensureInitialized()
        .encodeMap<CreateAccountRequestParams>(
            this as CreateAccountRequestParams);
  }

  CreateAccountRequestParamsCopyWith<CreateAccountRequestParams,
          CreateAccountRequestParams, CreateAccountRequestParams>
      get copyWith => _CreateAccountRequestParamsCopyWithImpl(
          this as CreateAccountRequestParams, $identity, $identity);
  @override
  String toString() {
    return CreateAccountRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as CreateAccountRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return CreateAccountRequestParamsMapper.ensureInitialized()
        .equalsValue(this as CreateAccountRequestParams, other);
  }

  @override
  int get hashCode {
    return CreateAccountRequestParamsMapper.ensureInitialized()
        .hashValue(this as CreateAccountRequestParams);
  }
}

extension CreateAccountRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateAccountRequestParams, $Out> {
  CreateAccountRequestParamsCopyWith<$R, CreateAccountRequestParams, $Out>
      get $asCreateAccountRequestParams => $base
          .as((v, t, t2) => _CreateAccountRequestParamsCopyWithImpl(v, t, t2));
}

abstract class CreateAccountRequestParamsCopyWith<
    $R,
    $In extends CreateAccountRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accountName, String? currencyCode, double? initialBalance});
  CreateAccountRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateAccountRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateAccountRequestParams, $Out>
    implements
        CreateAccountRequestParamsCopyWith<$R, CreateAccountRequestParams,
            $Out> {
  _CreateAccountRequestParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateAccountRequestParams> $mapper =
      CreateAccountRequestParamsMapper.ensureInitialized();
  @override
  $R call(
          {String? accountName,
          String? currencyCode,
          double? initialBalance}) =>
      $apply(FieldCopyWithData({
        if (accountName != null) #accountName: accountName,
        if (currencyCode != null) #currencyCode: currencyCode,
        if (initialBalance != null) #initialBalance: initialBalance
      }));
  @override
  CreateAccountRequestParams $make(CopyWithData data) =>
      CreateAccountRequestParams(
          accountName: data.get(#accountName, or: $value.accountName),
          currencyCode: data.get(#currencyCode, or: $value.currencyCode),
          initialBalance: data.get(#initialBalance, or: $value.initialBalance));

  @override
  CreateAccountRequestParamsCopyWith<$R2, CreateAccountRequestParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CreateAccountRequestParamsCopyWithImpl($value, $cast, t);
}
