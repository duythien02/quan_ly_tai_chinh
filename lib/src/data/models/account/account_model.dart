import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable(createToJson: false)
class AccountModel {
  AccountModel({
    required this.items,
    this.currentPage,
    this.pageSize,
    this.totalPages,
    this.totalItems,
  });

  factory AccountModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$AccountModelFromJson(json);

  @JsonKey(name: 'items')
  final List<AccountDocsModel?> items;

  @JsonKey(name: 'currentPage')
  final int? currentPage;

  @JsonKey(name: 'pageSize')
  final int? pageSize;

  @JsonKey(name: 'totalPages')
  final int? totalPages;

  @JsonKey(name: 'totalItems')
  final int? totalItems;
}

@JsonSerializable()
class AccountDocsModel {
  AccountDocsModel({
    required this.id,
    required this.accountName,
    required this.currencyCode,
    required this.initialBalance,
    required this.currentBalance,
  });

  factory AccountDocsModel.fromJson(final Map<String, dynamic> json) =>
      _$AccountDocsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDocsModelToJson(this);

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'account_name')
  final String? accountName;

  @JsonKey(name: 'currency_code')
  final String? currencyCode;

  @JsonKey(name: 'initial_balance')
  final double? initialBalance;

  @JsonKey(name: 'current_balance')
  final double? currentBalance;
}
