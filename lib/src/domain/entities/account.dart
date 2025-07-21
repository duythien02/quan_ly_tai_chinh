import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'account.g.dart';

@HiveType(typeId: ModelTypeId.account)
class Account {
  Account({
    required this.items,
    this.currentPage,
    this.pageSize,
    this.totalPages,
    this.totalItems,
  });

  @HiveField(0)
  final List<AccountDocs?> items;
  @HiveField(1)
  final int? currentPage;
  @HiveField(2)
  final int? pageSize;
  @HiveField(3)
  final int? totalPages;
  @HiveField(4)
  final int? totalItems;
}

@HiveType(typeId: ModelTypeId.accountDocs)
class AccountDocs {
  AccountDocs({
    this.id,
    this.accountName,
    this.currencyCode,
    this.initialBalance,
    this.currentBalance,
  });
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? accountName;

  @HiveField(2)
  final String? currencyCode;

  @HiveField(3)
  final double? initialBalance;

  @HiveField(4)
  final double? currentBalance;
}
