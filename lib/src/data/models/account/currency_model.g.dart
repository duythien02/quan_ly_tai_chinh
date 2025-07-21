// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      items: (json['items'] is List)
          ? (json['items'] as List<dynamic>)
              .map((e) => CurrencyDocsModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );

CurrencyDocsModel _$CurrencyDocsModelFromJson(Map<String, dynamic> json) =>
    CurrencyDocsModel(
      code: json['code']?.toString(),
      name: json['name']?.toString(),
      symbol: json['symbol']?.toString(),
    );

Map<String, dynamic> _$CurrencyDocsModelToJson(CurrencyDocsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('symbol', instance.symbol);
  return val;
}
