// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../config.dart';
import '../core/config/defines/keys.dart';
import '../core/network/ez_network.dart';
import '../core/network/interceptors/auth_interceptor.dart';
import '../data/datasources/remote/api_services.dart';
import '../injector/injector.dart';

@module
abstract class RegisterModule {
  // register named for api services
  @Named(kApiDio)
  Dio get apiDio => getIt<Network>().apiProvider.apiDio;
  @Named(kApiBaseUrl)
  String get apiBaseUrl => getIt<Network>().apiProvider.apiDio.options.baseUrl;

  @lazySingleton
  AuthApiService registerApiService(
    @Named(kApiDio) final Dio dio,
    @Named(kApiBaseUrl) final String url,
  ) =>
      AuthApiService(
        dio,
        baseUrl: url,
      );

  @lazySingleton
  AccountApiService accountApiService(
    @Named(kApiDio) final Dio dio,
    @Named(kApiBaseUrl) final String url,
  ) =>
      AccountApiService(
        dio,
        baseUrl: url,
      );

  @lazySingleton
  Dio provideDio(final AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Config.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: Headers.jsonContentType,
      ),
    );

    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
