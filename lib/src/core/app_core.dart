// Project imports:
import '../../../config.dart';
import '../data/datasources/local/cache/hive/ez_cache.dart';
import '../injector/injector.dart';
import 'logger/logger.dart';
import 'network/ez_network.dart';
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
  }
}
