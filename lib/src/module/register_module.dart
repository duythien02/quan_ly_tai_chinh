// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../core/config/defines/keys.dart';
import '../core/network/ez_network.dart';
import '../core/network/interceptors/auth_interceptor.dart';
import '../data/datasources/remote/api_services.dart';
import '../data/datasources/remote/category_api_service.dart';
import '../data/datasources/remote/transaction_api_service.dart';
import '../data/datasources/remote/user_profile_api_service.dart';
import '../domain/usecases/access_token_get_usecase.dart';
import '../domain/usecases/access_token_remove_usecase.dart';
import '../domain/usecases/access_token_save_usecase.dart';
import '../domain/usecases/auth/refresh_token_usecase.dart';
import '../domain/usecases/refresh_token_get_usecase.dart';
import '../domain/usecases/refresh_token_save_usecase.dart';
import '../injector/injector.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AuthInterceptor authInterceptor(
    final RefreshTokenUseCase refreshTokenUseCase,
    final RefreshTokenGetUseCase refreshTokenGetUseCase,
    final RefreshTokenSaveUseCase refreshTokenSaveUseCase,
    final AccessTokenGetUseCase accessTokenGetUseCase,
    final AccessTokenSaveUseCase accessTokenSaveUseCase,
    final AccessTokenRemoveUseCase accessTokenRemoveUseCase,
  ) =>
      AuthInterceptor(
        refreshTokenUseCase,
        refreshTokenGetUseCase,
        refreshTokenSaveUseCase,
        accessTokenGetUseCase,
        accessTokenSaveUseCase,
        accessTokenRemoveUseCase,
      );
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
  UserProfileApiService userProfileApiService(
    @Named(kApiDio) final Dio dio,
    @Named(kApiBaseUrl) final String url,
  ) =>
      UserProfileApiService(dio, baseUrl: url);

  @lazySingleton
  TransactionApiService transactionApiService(
    @Named(kApiDio) final Dio dio,
    @Named(kApiBaseUrl) final String url,
  ) =>
      TransactionApiService(dio, baseUrl: url);

  @lazySingleton
  CategoryApiService categoryApiService(
    @Named(kApiDio) final Dio dio,
    @Named(kApiBaseUrl) final String url,
  ) =>
      CategoryApiService(dio, baseUrl: url);
}
