import 'package:hive/hive.dart';

import '../../data/models/model_type_id.dart';

part 'transaction_summary.g.dart';

@HiveType(typeId: ModelTypeId.transactionSummary)
class TransactionSummary {
  TransactionSummary({
    required this.items,
  });

  @HiveField(0)
  final List<TransactionSummaryDocs?> items;
}

@HiveType(typeId: ModelTypeId.transactionSummaryDocs)
class TransactionSummaryDocs {
  TransactionSummaryDocs({
    this.date,
    this.totalExpense,
    this.totalIncome,
  });

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final double? totalExpense;

  @HiveField(2)
  final double? totalIncome;
}
