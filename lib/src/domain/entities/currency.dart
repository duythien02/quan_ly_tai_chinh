import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'currency.g.dart';

@HiveType(typeId: ModelTypeId.currency)
class Currency {
  Currency({
    required this.items,
  });

  @HiveField(0)
  final List<CurrencyDocs> items;
}

@HiveType(typeId: ModelTypeId.currencyDocs)
class CurrencyDocs {
  CurrencyDocs({
    this.code,
    this.name,
    this.symbol,
  });

  @HiveField(0)
  final String? code;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? symbol;
}
