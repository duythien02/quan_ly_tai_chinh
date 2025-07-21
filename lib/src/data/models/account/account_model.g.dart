// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      items: (json['items'] is List)
          ? (json['items'] as List<dynamic>)
              .map((e) => e == null || e is! Map
                  ? null
                  : AccountDocsModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      currentPage: double.tryParse(json['currentPage'].toString())?.toInt(),
      pageSize: double.tryParse(json['pageSize'].toString())?.toInt(),
      totalPages: double.tryParse(json['totalPages'].toString())?.toInt(),
      totalItems: double.tryParse(json['totalItems'].toString())?.toInt(),
    );

AccountDocsModel _$AccountDocsModelFromJson(Map<String, dynamic> json) =>
    AccountDocsModel(
      id: double.tryParse(json['id'].toString())?.toInt(),
      accountName: json['account_name']?.toString(),
      currencyCode: json['currency_code']?.toString(),
      initialBalance: double.tryParse(json['initial_balance'].toString()),
      currentBalance: double.tryParse(json['current_balance'].toString()),
    );

Map<String, dynamic> _$AccountDocsModelToJson(AccountDocsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('account_name', instance.accountName);
  writeNotNull('currency_code', instance.currencyCode);
  writeNotNull('initial_balance', instance.initialBalance);
  writeNotNull('current_balance', instance.currentBalance);
  return val;
}
