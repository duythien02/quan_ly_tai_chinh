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
    this.id,
    this.accountName,
    this.currencyCode,
    this.initialBalance,
    this.currentBalance,
    this.isMain,
    this.accountSymbol,
    this.totalExpense,
    this.totalIncome,
  });

  factory AccountDocsModel.fromJson(final Map<String, dynamic> json) =>
      _$AccountDocsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDocsModelToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'account_name')
  final String? accountName;

  @JsonKey(name: 'currency_code')
  final String? currencyCode;

  @JsonKey(name: 'account_symbol')
  final String? accountSymbol;

  @JsonKey(name: 'initial_balance')
  final double? initialBalance;

  @JsonKey(name: 'current_balance')
  final double? currentBalance;

  @JsonKey(name: 'is_main')
  final bool? isMain;

  @JsonKey(name: 'total_expense')
  final double? totalExpense;

  @JsonKey(name: 'total_income')
  final double? totalIncome;
}
