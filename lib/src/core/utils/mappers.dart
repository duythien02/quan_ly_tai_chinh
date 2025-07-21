// Package imports:
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../data/models/models.dart';
import '../../domain/entities/entities.dart';
import 'mappers.auto_mappr.dart';

// Package imports:
// ignore_for_file: lines_longer_than_80_chars

@AutoMappr([
  MapType<UserModel, User>(),
  MapType<AccountModel, Account>(),
  MapType<AccountDocsModel, AccountDocs>(),
  MapType<CurrencyModel, Currency>(),
  MapType<CurrencyDocsModel, CurrencyDocs>(),
])
@lazySingleton
class Mapper extends $Mapper {}
