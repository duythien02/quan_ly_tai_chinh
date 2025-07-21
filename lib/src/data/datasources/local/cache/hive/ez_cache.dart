// Dart imports:
import 'dart:async';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../../core/logger/logger.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/entities/user.dart';
import '../../../../../injector/injector.dart';
import '../../auth/auth_dao.dart';
import '../../key/keys.dart';

@lazySingleton
class EZCache {
  late Box<dynamic> box;

  /// cache initialization
  Future<void> init() async {
    await Hive.initFlutter();
    await registerAdapter();

    try {
      box = await Hive.openBox<dynamic>(Keys.hiveBoxName);
    } catch (e) {
      Log.error('Error opening Hive box: $e');
      await Hive.deleteBoxFromDisk(Keys.hiveBoxName);
    }
  }

  // General Methods: ------------------------------------------------
  Future<T?> get<T>(final String key) async {
    try {
      return await box.get(key) as T?;
    } catch (e) {
      Log.error('Error getting value from Hive: $e');
      return null;
    }
  }

  Future<void> save<T>(final String key, final T value) {
    try {
      return box.put(key, value);
    } catch (e) {
      Log.error('Error saving value to Hive: $e');
      return Future.value();
    }
  }

  Future<void> remove(final String key) async {
    try {
      return box.delete(key);
    } catch (e) {
      Log.error('Error removing value from Hive: $e');
      return Future.value();
    }
  }

  Future<void> clearAllCache() async {
    try {
      await box.clear();
    } catch (e) {
      Log.error('Error clearing Hive cache: $e');
      return Future.value();
    }
  }

  Future<int> get fontOption async {
    final option = await get<int>(Keys.fontOption);

    return option ?? 0;
  }

  Future<void> saveFontOption(final int fontIndex) =>
      save<int>(Keys.fontOption, fontIndex);

  Future<String> get languageOption async {
    final option = await get<String>(Keys.languageOption);

    return option ?? AppLocale.vi;
  }

  Future<void> saveLanguageOption(final String languageIndex) =>
      save<String>(Keys.languageOption, languageIndex);

  Future<int> get themeOption async {
    final option = await get<int>(Keys.themeOption);

    return option ?? 0;
  }

  Future<void> saveThemeOption(final int themeIndex) =>
      save<int>(Keys.themeOption, themeIndex);

  Future<void> saveDeviceInfo(final Map<String, dynamic> deviceInfo) {
    return save(Keys.deviceInfo, deviceInfo);
  }

  Future<Map<String, dynamic>> get deviceInfo async {
    final info = await get<Map<String, dynamic>?>(Keys.deviceInfo);

    return info ?? <String, dynamic>{};
  }

  Future<void> saveAppVersion(final String? appVersion) {
    return save(Keys.versionApp, appVersion);
  }

  Future<String> get appVersion async {
    final version = await get<String?>(Keys.versionApp);

    return Utils.nullSafety(version);
  }

  Future<String> get accessToken async {
    final token = await get<String?>(Keys.accessToken);

    return Utils.nullSafety(token);
  }

  Future<void> saveAccessToken(final String? accessToken) {
    return save(Keys.accessToken, accessToken);
  }

  Future<void> removeAccessToken() {
    return remove(Keys.accessToken);
  }

  Future<String> get refreshToken async {
    final token = await get<String?>(Keys.refreshToken);

    return Utils.nullSafety(token);
  }

  Future<void> saveRefreshToken(final String? refreshToken) {
    return save(Keys.refreshToken, refreshToken);
  }

  Future<void> removeRefreshToken() {
    return remove(Keys.refreshToken);
  }

  Future<String> get firebaseToken async {
    final token = await get<String>(Keys.firebaseToken);

    return token ?? '';
  }

  Future<void> saveFirebaseToken(final String? firebaseToken) {
    return save<String?>(Keys.firebaseToken, firebaseToken);
  }

  UserDao get userDao => getIt<UserDao>();

  static Future<void> registerAdapter() async {
    Hive.registerAdapter(UserAdapter());
  }
}
