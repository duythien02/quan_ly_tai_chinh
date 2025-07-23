// Project imports:
import '../../../config.dart';
import '../data/datasources/local/cache/hive/ez_cache.dart';
import '../injector/injector.dart';
import 'logger/logger.dart';
import 'network/ez_network.dart';
import 'network/interceptors/auth_interceptor.dart';
import 'network/interceptors/header_interceptor.dart';
import 'utils/api_helper.dart';

class AppCore {
  static Future<void> run({
    required final Environment environment,
  }) async {
    // init configs for network api, etc.
    await Config.init(environment: environment);
    final isDebug = Config.isDebug;
    // Setup logger
    Log.init(enable: isDebug);
    await getIt<EZCache>().init();
    getIt.registerSingleton<Network>(
      Network(
        enableLogger: isDebug,
        environment: environment,
        getHeadersApiProvider: getHeaders,
      ),
    );
    // Lấy Dio instance vừa được tạo bên trong Network
    final dio = getIt<Network>().apiProvider.apiDio;

    // Lấy các interceptor đã được đăng ký trong configureDependencies()
    final authInterceptor = getIt<AuthInterceptor>();

    // Thêm các interceptor vào Dio
    dio.interceptors.addAll([
      authInterceptor,
    ]);
  }
}
