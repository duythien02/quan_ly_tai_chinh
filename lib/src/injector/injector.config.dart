// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:TDTFinance/src/core/network/ez_network.dart' as _i3;
import 'package:TDTFinance/src/core/network/interceptors/auth_interceptor.dart'
    as _i54;
import 'package:TDTFinance/src/core/utils/deeplink_helper.dart' as _i14;
import 'package:TDTFinance/src/core/utils/mappers.dart' as _i8;
import 'package:TDTFinance/src/data/datasources/local/auth/auth_dao.dart'
    as _i24;
import 'package:TDTFinance/src/data/datasources/local/auth/auth_dao_impl.dart'
    as _i25;
import 'package:TDTFinance/src/data/datasources/local/cache/hive/ez_cache.dart'
    as _i4;
import 'package:TDTFinance/src/data/datasources/remote/account_api_service.dart'
    as _i21;
import 'package:TDTFinance/src/data/datasources/remote/api_services.dart'
    as _i18;
import 'package:TDTFinance/src/data/datasources/remote/auth_api_service.dart'
    as _i28;
import 'package:TDTFinance/src/data/repositories/account_repository_impl.dart'
    as _i20;
import 'package:TDTFinance/src/data/repositories/auth_repository_impl.dart'
    as _i27;
import 'package:TDTFinance/src/data/repositories/helper_repository_impl.dart'
    as _i6;
import 'package:TDTFinance/src/data/repositories/setting_repository_impl.dart'
    as _i13;
import 'package:TDTFinance/src/domain/repositories/account_repository.dart'
    as _i19;
import 'package:TDTFinance/src/domain/repositories/auth_repository.dart'
    as _i26;
import 'package:TDTFinance/src/domain/repositories/helper_repository.dart'
    as _i5;
import 'package:TDTFinance/src/domain/repositories/setting_repository.dart'
    as _i12;
import 'package:TDTFinance/src/domain/usecases/access_token_get_usecase.dart'
    as _i15;
import 'package:TDTFinance/src/domain/usecases/access_token_remove_usecase.dart'
    as _i16;
import 'package:TDTFinance/src/domain/usecases/access_token_save_usecase.dart'
    as _i17;
import 'package:TDTFinance/src/domain/usecases/account/create_account_usecase.dart'
    as _i29;
import 'package:TDTFinance/src/domain/usecases/account/get_accounts_usecase.dart'
    as _i34;
import 'package:TDTFinance/src/domain/usecases/account/get_currencies_usecase.dart'
    as _i35;
import 'package:TDTFinance/src/domain/usecases/app_version_get_usecase.dart'
    as _i22;
import 'package:TDTFinance/src/domain/usecases/app_version_save_usecase.dart'
    as _i23;
import 'package:TDTFinance/src/domain/usecases/auth/get_saved_auth_usecase.dart'
    as _i38;
import 'package:TDTFinance/src/domain/usecases/auth/login_usecase.dart' as _i42;
import 'package:TDTFinance/src/domain/usecases/auth/refresh_token_usecase.dart'
    as _i43;
import 'package:TDTFinance/src/domain/usecases/auth/register_usecase.dart'
    as _i44;
import 'package:TDTFinance/src/domain/usecases/auth/save_user_usecase.dart'
    as _i48;
import 'package:TDTFinance/src/domain/usecases/device_info_get_usecase.dart'
    as _i30;
import 'package:TDTFinance/src/domain/usecases/device_info_save_usecase.dart'
    as _i31;
import 'package:TDTFinance/src/domain/usecases/firebase_token_get_usecase.dart'
    as _i32;
import 'package:TDTFinance/src/domain/usecases/firebase_token_save_usecase.dart'
    as _i33;
import 'package:TDTFinance/src/domain/usecases/refresh_token_get_usecase.dart'
    as _i9;
import 'package:TDTFinance/src/domain/usecases/refresh_token_remove_usecase.dart'
    as _i10;
import 'package:TDTFinance/src/domain/usecases/refresh_token_save_usecase.dart'
    as _i11;
import 'package:TDTFinance/src/domain/usecases/setting/get_font_option_usecase.dart'
    as _i36;
import 'package:TDTFinance/src/domain/usecases/setting/get_language_option_usecase.dart'
    as _i37;
import 'package:TDTFinance/src/domain/usecases/setting/get_theme_option_usecase.dart'
    as _i39;
import 'package:TDTFinance/src/domain/usecases/setting/is_dark_mode_usecase.dart'
    as _i40;
import 'package:TDTFinance/src/domain/usecases/setting/is_light_mode_usecase.dart'
    as _i41;
import 'package:TDTFinance/src/domain/usecases/setting/save_font_option_usecase.dart'
    as _i45;
import 'package:TDTFinance/src/domain/usecases/setting/save_language_option_usecase.dart'
    as _i46;
import 'package:TDTFinance/src/domain/usecases/setting/save_theme_option_usecase.dart'
    as _i47;
import 'package:TDTFinance/src/module/register_module.dart' as _i57;
import 'package:TDTFinance/src/presentation/_blocs/authentication/token_authentication_bloc.dart'
    as _i51;
import 'package:TDTFinance/src/presentation/account/bloc/account_bloc.dart'
    as _i52;
import 'package:TDTFinance/src/presentation/auth/bloc/auth_bloc.dart' as _i53;
import 'package:TDTFinance/src/presentation/home_page/bloc/home_bloc.dart'
    as _i7;
import 'package:TDTFinance/src/presentation/settings/fonts/fonts_bloc.dart'
    as _i55;
import 'package:TDTFinance/src/presentation/settings/multi_language/multi_language_bloc.dart'
    as _i56;
import 'package:TDTFinance/src/presentation/settings/theme/theme_bloc.dart'
    as _i50;
import 'package:TDTFinance/src/presentation/tabbar/bloc/tabbar_bloc.dart'
    as _i49;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(
      () => registerModule.apiDio,
      instanceName: 'ApiDio',
    );
    gh.lazySingleton<_i4.EZCache>(() => _i4.EZCache());
    gh.lazySingleton<_i5.HelperRepository>(
        () => _i6.HelperRepositoryImpl(gh<_i4.EZCache>()));
    gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
    gh.lazySingleton<_i8.Mapper>(() => _i8.Mapper());
    gh.lazySingleton<_i9.RefreshTokenGetUseCase>(
        () => _i9.RefreshTokenGetUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i10.RefreshTokenRemoveUseCase>(
        () => _i10.RefreshTokenRemoveUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i11.RefreshTokenSaveUseCase>(
        () => _i11.RefreshTokenSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i12.SettingRepository>(
        () => _i13.SettingRepositoryImpl(cache: gh<_i4.EZCache>()));
    gh.factory<String>(
      () => registerModule.apiBaseUrl,
      instanceName: 'ApiBaseUrl',
    );
    gh.lazySingleton<_i14.UniLinkHelper>(() => _i14.UniLinkHelper());
    gh.lazySingleton<_i15.AccessTokenGetUseCase>(
        () => _i15.AccessTokenGetUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i16.AccessTokenRemoveUseCase>(
        () => _i16.AccessTokenRemoveUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i17.AccessTokenSaveUseCase>(
        () => _i17.AccessTokenSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i18.AccountApiService>(
        () => registerModule.accountApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.lazySingleton<_i19.AccountRepository>(() => _i20.AccountRepositoryImpl(
          gh<_i21.AccountApiService>(),
          gh<_i4.EZCache>(),
        ));
    gh.lazySingleton<_i22.AppVersionGetUseCase>(
        () => _i22.AppVersionGetUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i23.AppVersionSaveUseCase>(
        () => _i23.AppVersionSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i18.AuthApiService>(
        () => registerModule.registerApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.lazySingleton<_i24.AuthDao>(() => _i25.AuthDaoImpl(gh<_i4.EZCache>()));
    gh.lazySingleton<_i26.AuthRepository>(() => _i27.AuthRepositoryImpl(
          gh<_i28.AuthApiService>(),
          gh<_i4.EZCache>(),
        ));
    gh.factory<_i29.CreateAccountUsecase>(
        () => _i29.CreateAccountUsecase(gh<_i19.AccountRepository>()));
    gh.lazySingleton<_i14.DeeplinkHelper>(
        () => _i14.DeeplinkHelper(gh<_i14.UniLinkHelper>()));
    gh.lazySingleton<_i30.DeviceInfoGetUseCase>(
        () => _i30.DeviceInfoGetUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i31.DeviceInfoSaveUseCase>(
        () => _i31.DeviceInfoSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i32.FirebaseTokenGetUseCase>(
        () => _i32.FirebaseTokenGetUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i33.FirebaseTokenSaveUseCase>(
        () => _i33.FirebaseTokenSaveUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i34.GetAccountsUsecase>(
        () => _i34.GetAccountsUsecase(gh<_i19.AccountRepository>()));
    gh.factory<_i35.GetCurrenciesUsecase>(
        () => _i35.GetCurrenciesUsecase(gh<_i19.AccountRepository>()));
    gh.factory<_i36.GetFontOptionUseCase>(
        () => _i36.GetFontOptionUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i37.GetLanguageOptionUseCase>(
        () => _i37.GetLanguageOptionUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i38.GetSavedAuthUseCase>(
        () => _i38.GetSavedAuthUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i39.GetThemeOptionUseCase>(
        () => _i39.GetThemeOptionUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i40.IsDarkModeUseCase>(
        () => _i40.IsDarkModeUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i41.IsLightModeUseCase>(
        () => _i41.IsLightModeUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i42.LoginUsecase>(
        () => _i42.LoginUsecase(gh<_i26.AuthRepository>()));
    gh.factory<_i43.RefreshTokenUseCase>(
        () => _i43.RefreshTokenUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i44.RegisterUseCase>(
        () => _i44.RegisterUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i45.SaveFontOptionUseCase>(
        () => _i45.SaveFontOptionUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i46.SaveLanguageOptionUseCase>(
        () => _i46.SaveLanguageOptionUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i47.SaveThemeOptionUseCase>(
        () => _i47.SaveThemeOptionUseCase(gh<_i12.SettingRepository>()));
    gh.factory<_i48.SaveUserUseCase>(
        () => _i48.SaveUserUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i49.TabbarBloc>(
        () => _i49.TabbarBloc(gh<_i14.DeeplinkHelper>()));
    gh.factory<_i50.ThemeBloc>(() => _i50.ThemeBloc(
          gh<_i39.GetThemeOptionUseCase>(),
          gh<_i47.SaveThemeOptionUseCase>(),
        ));
    gh.factory<_i51.TokenAuthenticationBloc>(() =>
        _i51.TokenAuthenticationBloc(gh<_i16.AccessTokenRemoveUseCase>()));
    gh.factory<_i52.AccountBloc>(() => _i52.AccountBloc(
          gh<_i29.CreateAccountUsecase>(),
          gh<_i35.GetCurrenciesUsecase>(),
        ));
    gh.factory<_i53.AuthBloc>(() => _i53.AuthBloc(
          gh<_i44.RegisterUseCase>(),
          gh<_i48.SaveUserUseCase>(),
          gh<_i42.LoginUsecase>(),
        ));
    gh.lazySingleton<_i54.AuthInterceptor>(() => registerModule.authInterceptor(
          gh<_i43.RefreshTokenUseCase>(),
          gh<_i9.RefreshTokenGetUseCase>(),
          gh<_i11.RefreshTokenSaveUseCase>(),
          gh<_i15.AccessTokenGetUseCase>(),
          gh<_i17.AccessTokenSaveUseCase>(),
          gh<_i16.AccessTokenRemoveUseCase>(),
        ));
    gh.factory<_i55.FontsBloc>(() => _i55.FontsBloc(
          gh<_i36.GetFontOptionUseCase>(),
          gh<_i45.SaveFontOptionUseCase>(),
        ));
    gh.factory<_i56.MultiLanguageBloc>(() => _i56.MultiLanguageBloc(
          gh<_i37.GetLanguageOptionUseCase>(),
          gh<_i46.SaveLanguageOptionUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i57.RegisterModule {}
