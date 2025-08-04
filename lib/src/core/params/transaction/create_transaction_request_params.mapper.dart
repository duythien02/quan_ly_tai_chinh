// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_transaction_request_params.dart';

class CreateTransactionRequestParamsMapper
    extends ClassMapperBase<CreateTransactionRequestParams> {
  CreateTransactionRequestParamsMapper._();

  static CreateTransactionRequestParamsMapper? _instance;
  static CreateTransactionRequestParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CreateTransactionRequestParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateTransactionRequestParams';

  static double _$amount(CreateTransactionRequestParams v) => v.amount;
  static const Field<CreateTransactionRequestParams, double> _f$amount =
      Field('amount', _$amount);
  static String _$categoryId(CreateTransactionRequestParams v) => v.categoryId;
  static const Field<CreateTransactionRequestParams, String> _f$categoryId =
      Field('categoryId', _$categoryId);
  static String _$accountId(CreateTransactionRequestParams v) => v.accountId;
  static const Field<CreateTransactionRequestParams, String> _f$accountId =
      Field('accountId', _$accountId);
  static String _$date(CreateTransactionRequestParams v) => v.date;
  static const Field<CreateTransactionRequestParams, String> _f$date =
      Field('date', _$date);
  static String _$description(CreateTransactionRequestParams v) =>
      v.description;
  static const Field<CreateTransactionRequestParams, String> _f$description =
      Field('description', _$description);
  static String _$type(CreateTransactionRequestParams v) => v.type;
  static const Field<CreateTransactionRequestParams, String> _f$type =
      Field('type', _$type);

  @override
  final MappableFields<CreateTransactionRequestParams> fields = const {
    #amount: _f$amount,
    #categoryId: _f$categoryId,
    #accountId: _f$accountId,
    #date: _f$date,
    #description: _f$description,
    #type: _f$type,
  };
  @override
  final bool ignoreNull = true;

  static CreateTransactionRequestParams _instantiate(DecodingData data) {
    return CreateTransactionRequestParams(
        amount: data.dec(_f$amount),
        categoryId: data.dec(_f$categoryId),
        accountId: data.dec(_f$accountId),
        date: data.dec(_f$date),
        description: data.dec(_f$description),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateTransactionRequestParams fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateTransactionRequestParams>(map);
  }

  static CreateTransactionRequestParams deserialize(String json) {
    return ensureInitialized().decodeJson<CreateTransactionRequestParams>(json);
  }
}

mixin CreateTransactionRequestParamsMappable {
  String serialize() {
    return CreateTransactionRequestParamsMapper.ensureInitialized()
        .encodeJson<CreateTransactionRequestParams>(
            this as CreateTransactionRequestParams);
  }

  Map<String, dynamic> toJson() {
    return CreateTransactionRequestParamsMapper.ensureInitialized()
        .encodeMap<CreateTransactionRequestParams>(
            this as CreateTransactionRequestParams);
  }

  CreateTransactionRequestParamsCopyWith<CreateTransactionRequestParams,
          CreateTransactionRequestParams, CreateTransactionRequestParams>
      get copyWith => _CreateTransactionRequestParamsCopyWithImpl(
          this as CreateTransactionRequestParams, $identity, $identity);
  @override
  String toString() {
    return CreateTransactionRequestParamsMapper.ensureInitialized()
        .stringifyValue(this as CreateTransactionRequestParams);
  }

  @override
  bool operator ==(Object other) {
    return CreateTransactionRequestParamsMapper.ensureInitialized()
        .equalsValue(this as CreateTransactionRequestParams, other);
  }

  @override
  int get hashCode {
    return CreateTransactionRequestParamsMapper.ensureInitialized()
        .hashValue(this as CreateTransactionRequestParams);
  }
}

extension CreateTransactionRequestParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateTransactionRequestParams, $Out> {
  CreateTransactionRequestParamsCopyWith<$R, CreateTransactionRequestParams,
          $Out>
      get $asCreateTransactionRequestParams => $base.as(
          (v, t, t2) => _CreateTransactionRequestParamsCopyWithImpl(v, t, t2));
}

abstract class CreateTransactionRequestParamsCopyWith<
    $R,
    $In extends CreateTransactionRequestParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {double? amount,
      String? categoryId,
      String? accountId,
      String? date,
      String? description,
      String? type});
  CreateTransactionRequestParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateTransactionRequestParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateTransactionRequestParams, $Out>
    implements
        CreateTransactionRequestParamsCopyWith<$R,
            CreateTransactionRequestParams, $Out> {
  _CreateTransactionRequestParamsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateTransactionRequestParams> $mapper =
      CreateTransactionRequestParamsMapper.ensureInitialized();
  @override
  $R call(
          {double? amount,
          String? categoryId,
          String? accountId,
          String? date,
          String? description,
          String? type}) =>
      $apply(FieldCopyWithData({
        if (amount != null) #amount: amount,
        if (categoryId != null) #categoryId: categoryId,
        if (accountId != null) #accountId: accountId,
        if (date != null) #date: date,
        if (description != null) #description: description,
        if (type != null) #type: type
      }));
  @override
  CreateTransactionRequestParams $make(CopyWithData data) =>
      CreateTransactionRequestParams(
          amount: data.get(#amount, or: $value.amount),
          categoryId: data.get(#categoryId, or: $value.categoryId),
          accountId: data.get(#accountId, or: $value.accountId),
          date: data.get(#date, or: $value.date),
          description: data.get(#description, or: $value.description),
          type: data.get(#type, or: $value.type));

  @override
  CreateTransactionRequestParamsCopyWith<$R2, CreateTransactionRequestParams,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateTransactionRequestParamsCopyWithImpl($value, $cast, t);
}
