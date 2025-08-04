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
  MapType<AuthModel, Auth>(),
  MapType<AccountModel, Account>(),
  MapType<AccountDocsModel, AccountDocs>(),
  MapType<CurrencyModel, Currency>(),
  MapType<CurrencyDocsModel, CurrencyDocs>(),
  MapType<UserProfileModel, UserProfile>(),
  MapType<TransactionSummaryModel, TransactionSummary>(),
  MapType<TransactionSummaryDocsModel, TransactionSummaryDocs>(),
  MapType<CategoryModel, Category>(),
  MapType<CategoryDocsModel, CategoryDocs>(),
])
@lazySingleton
class Mapper extends $Mapper {}
