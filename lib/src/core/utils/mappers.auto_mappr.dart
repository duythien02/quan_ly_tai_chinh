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
import '../../domain/entities/account.dart' as _i5;
import '../../domain/entities/auth.dart' as _i3;
import '../../domain/entities/currency.dart' as _i7;

/// {@template package:TDTFinance/src/core/utils/mappers.dart}
/// Available mappings:
/// - `AuthModel` → `Auth`.
/// - `AccountModel` → `Account`.
/// - `AccountDocsModel` → `AccountDocs`.
/// - `CurrencyModel` → `Currency`.
/// - `CurrencyDocsModel` → `CurrencyDocs`.
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
    );
  }
}
