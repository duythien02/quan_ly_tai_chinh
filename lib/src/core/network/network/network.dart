// Project imports:
import '../../../../../config.dart';
import 'api_provider.dart';

class Network {
  factory Network({
    required final bool enableLogger,
    required final Environment environment,
    required final Future<Map<String, dynamic>> Function()
        getHeadersApiProvider,
  }) {
    return Network._init(
      enableLogger: enableLogger,
      environment: environment,
      getHeadersApiProvider: getHeadersApiProvider,
    );
  }

  Network._init({
    required this.enableLogger,
    required this.environment,
    required this.getHeadersApiProvider,
  }) {
    apiProvider = ApiProvider(
      baseUrl: Config.baseUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersApiProvider,
    );
  }

  final bool enableLogger;

  final Environment environment;

  final Future<Map<String, dynamic>> Function() getHeadersApiProvider;

  late ApiProvider apiProvider;
}
