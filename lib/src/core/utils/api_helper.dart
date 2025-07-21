// Dart imports:
import 'dart:convert';

// Project imports:
import '../../data/datasources/local/cache/hive/ez_cache.dart';
import '../../data/datasources/local/key/keys.dart';
import '../../domain/usecases/access_token_get_usecase.dart';
import '../../domain/usecases/device_info_get_usecase.dart';
import '../../domain/usecases/firebase_token_get_usecase.dart';
import '../../domain/usecases/setting/get_language_option_usecase.dart';
import '../../injector/injector.dart';
import '../app_strings.dart';

Future<Map<String, dynamic>> getHeaders() async {
  final getAccessTokenUseCase = getIt<AccessTokenGetUseCase>();
  final deviceInfo = await getDeviceInfo();
  final token = (await getIt<EZCache>().get<String?>(Keys.accessToken)) ??
      await getAccessTokenUseCase();
  final language = await getIt<GetLanguageOptionUseCase>()();
  return <String, dynamic>{
    Keys.authorization: token.isNotEmpty ? 'Bearer $token' : '',
    Keys.deviceInfo: deviceInfo,
    AppStrings.language: language,
  };
}

Future<String?> getDeviceInfo() async {
  try {
    final getFirebaseTokenUseCase = getIt<FirebaseTokenGetUseCase>();
    final getDeviceInfoUseCase = getIt<DeviceInfoGetUseCase>();

    final deviceInfo = await getDeviceInfoUseCase();
    final firebaseToken = await getFirebaseTokenUseCase();

    deviceInfo[Keys.firebaseToken] = firebaseToken;

    return jsonEncode(deviceInfo);
  } catch (error) {
    return null;
  }
}
