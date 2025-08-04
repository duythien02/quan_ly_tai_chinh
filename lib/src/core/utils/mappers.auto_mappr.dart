// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../data/models/account/account_model.dart' as _i4;
import '../../data/models/account/currency_model.dart' as _i6;
import '../../data/models/auth/auth_model.dart' as _i2;
import '../../data/models/category/category_model.dart' as _i12;
import '../../data/models/transaction/transaction_summary_model.dart' as _i10;
import '../../data/models/user_profile/user_profile_model.dart' as _i8;
import '../../domain/entities/account.dart' as _i5;
import '../../domain/entities/auth.dart' as _i3;
import '../../domain/entities/category.dart' as _i13;
import '../../domain/entities/currency.dart' as _i7;
import '../../domain/entities/transaction_summary.dart' as _i11;
import '../../domain/entities/user_profile.dart' as _i9;

/// {@template package:TDTFinance/src/core/utils/mappers.dart}
/// Available mappings:
/// - `AuthModel` → `Auth`.
/// - `AccountModel` → `Account`.
/// - `AccountDocsModel` → `AccountDocs`.
/// - `CurrencyModel` → `Currency`.
/// - `CurrencyDocsModel` → `CurrencyDocs`.
/// - `UserProfileModel` → `UserProfile`.
/// - `TransactionSummaryModel` → `TransactionSummary`.
/// - `TransactionSummaryDocsModel` → `TransactionSummaryDocs`.
/// - `CategoryModel` → `Category`.
/// - `CategoryDocsModel` → `CategoryDocs`.
/// {@endtemplate}
class $Mapper implements _i1.AutoMapprInterface {
  const $Mapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.AuthModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthModel?>()) &&
        (targetTypeOf == _typeOf<_i3.Auth>() ||
            targetTypeOf == _typeOf<_i3.Auth?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.AccountModel>() ||
            sourceTypeOf == _typeOf<_i4.AccountModel?>()) &&
        (targetTypeOf == _typeOf<_i5.Account>() ||
            targetTypeOf == _typeOf<_i5.Account?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.AccountDocsModel>() ||
            sourceTypeOf == _typeOf<_i4.AccountDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i5.AccountDocs>() ||
            targetTypeOf == _typeOf<_i5.AccountDocs?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.CurrencyModel>() ||
            sourceTypeOf == _typeOf<_i6.CurrencyModel?>()) &&
        (targetTypeOf == _typeOf<_i7.Currency>() ||
            targetTypeOf == _typeOf<_i7.Currency?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.CurrencyDocsModel>() ||
            sourceTypeOf == _typeOf<_i6.CurrencyDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i7.CurrencyDocs>() ||
            targetTypeOf == _typeOf<_i7.CurrencyDocs?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i8.UserProfileModel>() ||
            sourceTypeOf == _typeOf<_i8.UserProfileModel?>()) &&
        (targetTypeOf == _typeOf<_i9.UserProfile>() ||
            targetTypeOf == _typeOf<_i9.UserProfile?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i10.TransactionSummaryModel>() ||
            sourceTypeOf == _typeOf<_i10.TransactionSummaryModel?>()) &&
        (targetTypeOf == _typeOf<_i11.TransactionSummary>() ||
            targetTypeOf == _typeOf<_i11.TransactionSummary?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i10.TransactionSummaryDocsModel>() ||
            sourceTypeOf == _typeOf<_i10.TransactionSummaryDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i11.TransactionSummaryDocs>() ||
            targetTypeOf == _typeOf<_i11.TransactionSummaryDocs?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i12.CategoryModel>() ||
            sourceTypeOf == _typeOf<_i12.CategoryModel?>()) &&
        (targetTypeOf == _typeOf<_i13.Category>() ||
            targetTypeOf == _typeOf<_i13.Category?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i12.CategoryDocsModel>() ||
            sourceTypeOf == _typeOf<_i12.CategoryDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i13.CategoryDocs>() ||
            targetTypeOf == _typeOf<_i13.CategoryDocs?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(
        model,
        onMappingError: onMappingError,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
          (item) => _safeConvert(item, onMappingError: onMappingError));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.AuthModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthModel?>()) &&
        (targetTypeOf == _typeOf<_i3.Auth>() ||
            targetTypeOf == _typeOf<_i3.Auth?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthModel_To__i3$Auth((model as _i2.AuthModel?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.AccountModel>() ||
            sourceTypeOf == _typeOf<_i4.AccountModel?>()) &&
        (targetTypeOf == _typeOf<_i5.Account>() ||
            targetTypeOf == _typeOf<_i5.Account?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$AccountModel_To__i5$Account((model as _i4.AccountModel?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.AccountDocsModel>() ||
            sourceTypeOf == _typeOf<_i4.AccountDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i5.AccountDocs>() ||
            targetTypeOf == _typeOf<_i5.AccountDocs?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$AccountDocsModel_To__i5$AccountDocs(
          (model as _i4.AccountDocsModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.CurrencyModel>() ||
            sourceTypeOf == _typeOf<_i6.CurrencyModel?>()) &&
        (targetTypeOf == _typeOf<_i7.Currency>() ||
            targetTypeOf == _typeOf<_i7.Currency?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$CurrencyModel_To__i7$Currency(
          (model as _i6.CurrencyModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.CurrencyDocsModel>() ||
            sourceTypeOf == _typeOf<_i6.CurrencyDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i7.CurrencyDocs>() ||
            targetTypeOf == _typeOf<_i7.CurrencyDocs?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$CurrencyDocsModel_To__i7$CurrencyDocs(
          (model as _i6.CurrencyDocsModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i8.UserProfileModel>() ||
            sourceTypeOf == _typeOf<_i8.UserProfileModel?>()) &&
        (targetTypeOf == _typeOf<_i9.UserProfile>() ||
            targetTypeOf == _typeOf<_i9.UserProfile?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i8$UserProfileModel_To__i9$UserProfile(
          (model as _i8.UserProfileModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i10.TransactionSummaryModel>() ||
            sourceTypeOf == _typeOf<_i10.TransactionSummaryModel?>()) &&
        (targetTypeOf == _typeOf<_i11.TransactionSummary>() ||
            targetTypeOf == _typeOf<_i11.TransactionSummary?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i10$TransactionSummaryModel_To__i11$TransactionSummary(
          (model as _i10.TransactionSummaryModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i10.TransactionSummaryDocsModel>() ||
            sourceTypeOf == _typeOf<_i10.TransactionSummaryDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i11.TransactionSummaryDocs>() ||
            targetTypeOf == _typeOf<_i11.TransactionSummaryDocs?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i10$TransactionSummaryDocsModel_To__i11$TransactionSummaryDocs(
          (model as _i10.TransactionSummaryDocsModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i12.CategoryModel>() ||
            sourceTypeOf == _typeOf<_i12.CategoryModel?>()) &&
        (targetTypeOf == _typeOf<_i13.Category>() ||
            targetTypeOf == _typeOf<_i13.Category?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i12$CategoryModel_To__i13$Category(
          (model as _i12.CategoryModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i12.CategoryDocsModel>() ||
            sourceTypeOf == _typeOf<_i12.CategoryDocsModel?>()) &&
        (targetTypeOf == _typeOf<_i13.CategoryDocs>() ||
            targetTypeOf == _typeOf<_i13.CategoryDocs?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i12$CategoryDocsModel_To__i13$CategoryDocs(
          (model as _i12.CategoryDocsModel?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    try {
      return _convert(
        model,
        canReturnNull: true,
      );
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:TDTFinance/src/core/utils/mappers.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.Auth _map__i2$AuthModel_To__i3$Auth(_i2.AuthModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping AuthModel → Auth failed because AuthModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<AuthModel, Auth> to handle null values during mapping.');
    }
    return _i3.Auth(
      userId: model.userId,
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      hasAccounts: model.hasAccounts,
    );
  }

  _i5.Account _map__i4$AccountModel_To__i5$Account(_i4.AccountModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping AccountModel → Account failed because AccountModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<AccountModel, Account> to handle null values during mapping.');
    }
    return _i5.Account(
      items: model.items
          .map<_i5.AccountDocs?>((value) =>
              _map__i4$AccountDocsModel_To__i5$AccountDocs_Nullable(value))
          .toList(),
      currentPage: model.currentPage,
      pageSize: model.pageSize,
      totalPages: model.totalPages,
      totalItems: model.totalItems,
    );
  }

  _i5.AccountDocs _map__i4$AccountDocsModel_To__i5$AccountDocs(
      _i4.AccountDocsModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping AccountDocsModel → AccountDocs failed because AccountDocsModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<AccountDocsModel, AccountDocs> to handle null values during mapping.');
    }
    return _i5.AccountDocs(
      id: model.id,
      accountName: model.accountName,
      currencyCode: model.currencyCode,
      initialBalance: model.initialBalance,
      currentBalance: model.currentBalance,
      isMain: model.isMain,
      accountSymbol: model.accountSymbol,
      totalExpense: model.totalExpense,
      totalIncome: model.totalIncome,
    );
  }

  _i7.Currency _map__i6$CurrencyModel_To__i7$Currency(
      _i6.CurrencyModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CurrencyModel → Currency failed because CurrencyModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CurrencyModel, Currency> to handle null values during mapping.');
    }
    return _i7.Currency(
        items: model.items
            .map<_i7.CurrencyDocs>((value) =>
                _map__i6$CurrencyDocsModel_To__i7$CurrencyDocs(value))
            .toList());
  }

  _i7.CurrencyDocs _map__i6$CurrencyDocsModel_To__i7$CurrencyDocs(
      _i6.CurrencyDocsModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CurrencyDocsModel → CurrencyDocs failed because CurrencyDocsModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CurrencyDocsModel, CurrencyDocs> to handle null values during mapping.');
    }
    return _i7.CurrencyDocs(
      code: model.code,
      name: model.name,
      symbol: model.symbol,
    );
  }

  _i9.UserProfile _map__i8$UserProfileModel_To__i9$UserProfile(
      _i8.UserProfileModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UserProfileModel → UserProfile failed because UserProfileModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UserProfileModel, UserProfile> to handle null values during mapping.');
    }
    return _i9.UserProfile(
      id: model.id,
      username: model.username,
      email: model.email,
      avatar: model.avatar,
    );
  }

  _i11.TransactionSummary
      _map__i10$TransactionSummaryModel_To__i11$TransactionSummary(
          _i10.TransactionSummaryModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionSummaryModel → TransactionSummary failed because TransactionSummaryModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionSummaryModel, TransactionSummary> to handle null values during mapping.');
    }
    return _i11.TransactionSummary(
        items: model.items
            .map<_i11.TransactionSummaryDocs?>((value) =>
                _map__i10$TransactionSummaryDocsModel_To__i11$TransactionSummaryDocs_Nullable(
                    value))
            .toList());
  }

  _i11.TransactionSummaryDocs
      _map__i10$TransactionSummaryDocsModel_To__i11$TransactionSummaryDocs(
          _i10.TransactionSummaryDocsModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionSummaryDocsModel → TransactionSummaryDocs failed because TransactionSummaryDocsModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionSummaryDocsModel, TransactionSummaryDocs> to handle null values during mapping.');
    }
    return _i11.TransactionSummaryDocs(
      date: model.date,
      totalExpense: model.totalExpense,
      totalIncome: model.totalIncome,
    );
  }

  _i13.Category _map__i12$CategoryModel_To__i13$Category(
      _i12.CategoryModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CategoryModel → Category failed because CategoryModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CategoryModel, Category> to handle null values during mapping.');
    }
    return _i13.Category(
        items: model.items
            .map<_i13.CategoryDocs?>((value) =>
                _map__i12$CategoryDocsModel_To__i13$CategoryDocs_Nullable(
                    value))
            .toList());
  }

  _i13.CategoryDocs _map__i12$CategoryDocsModel_To__i13$CategoryDocs(
      _i12.CategoryDocsModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CategoryDocsModel → CategoryDocs failed because CategoryDocsModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CategoryDocsModel, CategoryDocs> to handle null values during mapping.');
    }
    return _i13.CategoryDocs(
      id: model.id,
      name: model.name,
      type: model.type,
      iconUrl: model.iconUrl,
      description: model.description,
    );
  }

  _i5.AccountDocs? _map__i4$AccountDocsModel_To__i5$AccountDocs_Nullable(
      _i4.AccountDocsModel? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i5.AccountDocs(
      id: model.id,
      accountName: model.accountName,
      currencyCode: model.currencyCode,
      initialBalance: model.initialBalance,
      currentBalance: model.currentBalance,
      isMain: model.isMain,
      accountSymbol: model.accountSymbol,
      totalExpense: model.totalExpense,
      totalIncome: model.totalIncome,
    );
  }

  _i11.TransactionSummaryDocs?
      _map__i10$TransactionSummaryDocsModel_To__i11$TransactionSummaryDocs_Nullable(
          _i10.TransactionSummaryDocsModel? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i11.TransactionSummaryDocs(
      date: model.date,
      totalExpense: model.totalExpense,
      totalIncome: model.totalIncome,
    );
  }

  _i13.CategoryDocs? _map__i12$CategoryDocsModel_To__i13$CategoryDocs_Nullable(
      _i12.CategoryDocsModel? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i13.CategoryDocs(
      id: model.id,
      name: model.name,
      type: model.type,
      iconUrl: model.iconUrl,
      description: model.description,
    );
  }
}
