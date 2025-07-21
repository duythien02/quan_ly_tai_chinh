// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../domain/repositories/helper_repository.dart';
import '../datasources/local/cache/hive/ez_cache.dart';

@LazySingleton(as: HelperRepository)
class HelperRepositoryImpl implements HelperRepository {
  const HelperRepositoryImpl(this._cache);
  final EZCache _cache;

  @override
  Future<void> saveDeviceInfo(final Map<String, dynamic> deviceInfo) {
    return _cache.saveDeviceInfo(deviceInfo);
  }

  @override
  Future<Map<String, dynamic>> get deviceInfo {
    return _cache.deviceInfo;
  }

  @override
  Future<String> get appVersion {
    return _cache.appVersion;
  }

  @override
  Future<void> saveAppVersion(final String appVersion) {
    return _cache.saveAppVersion(appVersion);
  }

  @override
  Future<String> get accessToken {
    return _cache.accessToken;
  }

  @override
  Future<void> saveAccessToken(final String? token) {
    return _cache.saveAccessToken(token);
  }

  @override
  Future<void> removeAccessToken() {
    return _cache.removeAccessToken();
  }

  @override
  Future<String> get refreshToken {
    return _cache.refreshToken;
  }

  @override
  Future<void> saveRefreshToken(final String? token) {
    return _cache.saveRefreshToken(token);
  }

  @override
  Future<void> removeRefreshToken() {
    return _cache.removeRefreshToken();
  }

  @override
  Future<String> get firebaseToken => _cache.firebaseToken;

  @override
  Future<void> saveFirebaseToken(final String? firebaseToken) {
    return _cache.saveFirebaseToken(firebaseToken);
  }
}
