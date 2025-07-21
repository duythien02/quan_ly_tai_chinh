abstract class HelperRepository {
  Future<void> saveAccessToken(final String? token);
  Future<String> get accessToken;
  Future<void> removeAccessToken();

  Future<void> saveRefreshToken(final String? token);
  Future<String> get refreshToken;
  Future<void> removeRefreshToken();

  Future<void> saveDeviceInfo(final Map<String, dynamic> deviceInfo);
  Future<Map<String, dynamic>> get deviceInfo;

  Future<void> saveAppVersion(final String appVersion);
  Future<String> get appVersion;

  Future<String> get firebaseToken;
  Future<void> saveFirebaseToken(final String? firebaseToken);
}
