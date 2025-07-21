import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable(createToJson: false)
class CurrencyModel {
  CurrencyModel({
    required this.items,
  });

  factory CurrencyModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$CurrencyModelFromJson(json);

  @JsonKey(name: 'items')
  final List<CurrencyDocsModel> items;
}

@JsonSerializable()
class CurrencyDocsModel {
  CurrencyDocsModel({
    this.code,
    this.name,
    this.symbol,
  });
  factory CurrencyDocsModel.fromJson(final Map<String, dynamic> json) =>
      _$CurrencyDocsModelFromJson(json);

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'symbol')
  final String? symbol;

  Map<String, dynamic> toJson() => _$CurrencyDocsModelToJson(this);
}
