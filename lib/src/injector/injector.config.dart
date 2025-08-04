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
    as _i71;
import 'package:TDTFinance/src/core/utils/deeplink_helper.dart' as _i16;
import 'package:TDTFinance/src/core/utils/mappers.dart' as _i7;
import 'package:TDTFinance/src/data/datasources/local/auth/auth_dao.dart'
    as _i31;
import 'package:TDTFinance/src/data/datasources/local/auth/auth_dao_impl.dart'
    as _i32;
import 'package:TDTFinance/src/data/datasources/local/cache/hive/ez_cache.dart'
    as _i4;
import 'package:TDTFinance/src/data/datasources/local/user_profile/user_profile_dao.dart'
    as _i18;
import 'package:TDTFinance/src/data/datasources/local/user_profile/user_profile_dao_impl.dart'
    as _i19;
import 'package:TDTFinance/src/data/datasources/remote/account_api_service.dart'
    as _i28;
import 'package:TDTFinance/src/data/datasources/remote/api_services.dart'
    as _i25;
import 'package:TDTFinance/src/data/datasources/remote/auth_api_service.dart'
    as _i35;
import 'package:TDTFinance/src/data/datasources/remote/category_api_service.dart'
    as _i36;
import 'package:TDTFinance/src/data/datasources/remote/transaction_api_service.dart'
    as _i13;
import 'package:TDTFinance/src/data/datasources/remote/user_profile_api_service.dart'
    as _i17;
import 'package:TDTFinance/src/data/repositories/account_repository_impl.dart'
    as _i27;
import 'package:TDTFinance/src/data/repositories/auth_repository_impl.dart'
    as _i34;
import 'package:TDTFinance/src/data/repositories/category_repository_impl.dart'
    as _i38;
import 'package:TDTFinance/src/data/repositories/helper_repository_impl.dart'
    as _i6;
import 'package:TDTFinance/src/data/repositories/setting_repository_impl.dart'
    as _i12;
import 'package:TDTFinance/src/data/repositories/transaction_repository.impl.dart'
    as _i15;
import 'package:TDTFinance/src/data/repositories/user_profile_repository_impl.dart'
    as _i21;
import 'package:TDTFinance/src/domain/repositories/account_repository.dart'
    as _i26;
import 'package:TDTFinance/src/domain/repositories/auth_repository.dart'
    as _i33;
import 'package:TDTFinance/src/domain/repositories/category_repository.dart'
    as _i37;
import 'package:TDTFinance/src/domain/repositories/helper_repository.dart'
    as _i5;
import 'package:TDTFinance/src/domain/repositories/setting_repository.dart'
    as _i11;
import 'package:TDTFinance/src/domain/repositories/transaction_repository.dart'
    as _i14;
import 'package:TDTFinance/src/domain/repositories/user_profile_repository.dart'
    as _i20;
import 'package:TDTFinance/src/domain/usecases/access_token_get_usecase.dart'
    as _i22;
import 'package:TDTFinance/src/domain/usecases/access_token_remove_usecase.dart'
    as _i23;
import 'package:TDTFinance/src/domain/usecases/access_token_save_usecase.dart'
    as _i24;
import 'package:TDTFinance/src/domain/usecases/account/create_account_usecase.dart'
    as _i39;
import 'package:TDTFinance/src/domain/usecases/account/get_accounts_usecase.dart'
    as _i45;
import 'package:TDTFinance/src/domain/usecases/account/get_currencies_usecase.dart'
    as _i47;
import 'package:TDTFinance/src/domain/usecases/app_version_get_usecase.dart'
    as _i29;
import 'package:TDTFinance/src/domain/usecases/app_version_save_usecase.dart'
    as _i30;
import 'package:TDTFinance/src/domain/usecases/auth/get_saved_auth_usecase.dart'
    as _i50;
import 'package:TDTFinance/src/domain/usecases/auth/login_usecase.dart' as _i57;
import 'package:TDTFinance/src/domain/usecases/auth/refresh_token_usecase.dart'
    as _i59;
import 'package:TDTFinance/src/domain/usecases/auth/register_usecase.dart'
    as _i60;
import 'package:TDTFinance/src/domain/usecases/auth/remove_auth_usecase.dart'
    as _i61;
import 'package:TDTFinance/src/domain/usecases/auth/save_auth_usecase.dart'
    as _i65;
import 'package:TDTFinance/src/domain/usecases/category/get_categories_usecase.dart'
    as _i46;
import 'package:TDTFinance/src/domain/usecases/device_info_get_usecase.dart'
    as _i41;
import 'package:TDTFinance/src/domain/usecases/device_info_save_usecase.dart'
    as _i42;
import 'package:TDTFinance/src/domain/usecases/firebase_token_get_usecase.dart'
    as _i43;
import 'package:TDTFinance/src/domain/usecases/firebase_token_save_usecase.dart'
    as _i44;
import 'package:TDTFinance/src/domain/usecases/refresh_token_get_usecase.dart'
    as _i8;
import 'package:TDTFinance/src/domain/usecases/refresh_token_remove_usecase.dart'
    as _i9;
import 'package:TDTFinance/src/domain/usecases/refresh_token_save_usecase.dart'
    as _i10;
import 'package:TDTFinance/src/domain/usecases/setting/get_font_option_usecase.dart'
    as _i48;
import 'package:TDTFinance/src/domain/usecases/setting/get_language_option_usecase.dart'
    as _i49;
import 'package:TDTFinance/src/domain/usecases/setting/get_theme_option_usecase.dart'
    as _i51;
import 'package:TDTFinance/src/domain/usecases/setting/is_dark_mode_usecase.dart'
    as _i55;
import 'package:TDTFinance/src/domain/usecases/setting/is_light_mode_usecase.dart'
    as _i56;
import 'package:TDTFinance/src/domain/usecases/setting/save_font_option_usecase.dart'
    as _i62;
import 'package:TDTFinance/src/domain/usecases/setting/save_language_option_usecase.dart'
    as _i63;
import 'package:TDTFinance/src/domain/usecases/setting/save_theme_option_usecase.dart'
    as _i64;
import 'package:TDTFinance/src/domain/usecases/transaction/create_transaction_usecase.dart'
    as _i40;
import 'package:TDTFinance/src/domain/usecases/transaction/get_transaction_summary_usecase.dart'
    as _i52;
import 'package:TDTFinance/src/domain/usecases/user_profile/get_user_profile_usecase.dart'
    as _i53;
import 'package:TDTFinance/src/module/register_module.dart' as _i75;
import 'package:TDTFinance/src/presentation/_blocs/authentication/token_authentication_bloc.dart'
    as _i68;
import 'package:TDTFinance/src/presentation/account/bloc/account_bloc.dart'
    as _i69;
import 'package:TDTFinance/src/presentation/auth/bloc/auth_bloc.dart' as _i70;
import 'package:TDTFinance/src/presentation/create_transaction/bloc/create_transaction_bloc.dart'
    as _i72;
import 'package:TDTFinance/src/presentation/home_page/bloc/home_bloc.dart'
    as _i54;
import 'package:TDTFinance/src/presentation/profile/bloc/profile_bloc.dart'
    as _i58;
import 'package:TDTFinance/src/presentation/settings/fonts/fonts_bloc.dart'
    as _i73;
import 'package:TDTFinance/src/presentation/settings/multi_language/multi_language_bloc.dart'
    as _i74;
import 'package:TDTFinance/src/presentation/settings/theme/theme_bloc.dart'
    as _i67;
import 'package:TDTFinance/src/presentation/tabbar/bloc/tabbar_bloc.dart'
    as _i66;

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
    gh.lazySingleton<_i7.Mapper>(() => _i7.Mapper());
    gh.lazySingleton<_i8.RefreshTokenGetUseCase>(
        () => _i8.RefreshTokenGetUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i9.RefreshTokenRemoveUseCase>(
        () => _i9.RefreshTokenRemoveUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i10.RefreshTokenSaveUseCase>(
        () => _i10.RefreshTokenSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i11.SettingRepository>(
        () => _i12.SettingRepositoryImpl(cache: gh<_i4.EZCache>()));
    gh.factory<String>(
      () => registerModule.apiBaseUrl,
      instanceName: 'ApiBaseUrl',
    );
    gh.lazySingleton<_i13.TransactionApiService>(
        () => registerModule.transactionApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.lazySingleton<_i14.TransactionRepository>(
        () => _i15.TransactionRepositoryImpl(gh<_i13.TransactionApiService>()));
    gh.lazySingleton<_i16.UniLinkHelper>(() => _i16.UniLinkHelper());
    gh.lazySingleton<_i17.UserProfileApiService>(
        () => registerModule.userProfileApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.factory<_i18.UserProfileDao>(
        () => _i19.UserProfileDaoImpl(gh<_i4.EZCache>()));
    gh.lazySingleton<_i20.UserProfileRepository>(
        () => _i21.UserProfileRepositoryImpl(gh<_i17.UserProfileApiService>()));
    gh.lazySingleton<_i22.AccessTokenGetUseCase>(
        () => _i22.AccessTokenGetUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i23.AccessTokenRemoveUseCase>(
        () => _i23.AccessTokenRemoveUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i24.AccessTokenSaveUseCase>(
        () => _i24.AccessTokenSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i25.AccountApiService>(
        () => registerModule.accountApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.lazySingleton<_i26.AccountRepository>(() => _i27.AccountRepositoryImpl(
          gh<_i28.AccountApiService>(),
          gh<_i4.EZCache>(),
        ));
    gh.lazySingleton<_i29.AppVersionGetUseCase>(
        () => _i29.AppVersionGetUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i30.AppVersionSaveUseCase>(
        () => _i30.AppVersionSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i25.AuthApiService>(
        () => registerModule.registerApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.lazySingleton<_i31.AuthDao>(() => _i32.AuthDaoImpl(gh<_i4.EZCache>()));
    gh.lazySingleton<_i33.AuthRepository>(() => _i34.AuthRepositoryImpl(
          gh<_i35.AuthApiService>(),
          gh<_i4.EZCache>(),
        ));
    gh.lazySingleton<_i36.CategoryApiService>(
        () => registerModule.categoryApiService(
              gh<_i3.Dio>(instanceName: 'ApiDio'),
              gh<String>(instanceName: 'ApiBaseUrl'),
            ));
    gh.lazySingleton<_i37.CategoryRepository>(
        () => _i38.CategoryRepositoryImpl(gh<_i36.CategoryApiService>()));
    gh.factory<_i39.CreateAccountUsecase>(
        () => _i39.CreateAccountUsecase(gh<_i26.AccountRepository>()));
    gh.factory<_i40.CreateTransactionUsecase>(
        () => _i40.CreateTransactionUsecase(gh<_i14.TransactionRepository>()));
    gh.lazySingleton<_i16.DeeplinkHelper>(
        () => _i16.DeeplinkHelper(gh<_i16.UniLinkHelper>()));
    gh.lazySingleton<_i41.DeviceInfoGetUseCase>(
        () => _i41.DeviceInfoGetUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i42.DeviceInfoSaveUseCase>(
        () => _i42.DeviceInfoSaveUseCase(gh<_i5.HelperRepository>()));
    gh.lazySingleton<_i43.FirebaseTokenGetUseCase>(
        () => _i43.FirebaseTokenGetUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i44.FirebaseTokenSaveUseCase>(
        () => _i44.FirebaseTokenSaveUseCase(gh<_i5.HelperRepository>()));
    gh.factory<_i45.GetAccountsUsecase>(
        () => _i45.GetAccountsUsecase(gh<_i26.AccountRepository>()));
    gh.factory<_i46.GetCategoriesUsecase>(
        () => _i46.GetCategoriesUsecase(gh<_i37.CategoryRepository>()));
    gh.factory<_i47.GetCurrenciesUsecase>(
        () => _i47.GetCurrenciesUsecase(gh<_i26.AccountRepository>()));
    gh.factory<_i48.GetFontOptionUseCase>(
        () => _i48.GetFontOptionUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i49.GetLanguageOptionUseCase>(
        () => _i49.GetLanguageOptionUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i50.GetSavedAuthUseCase>(
        () => _i50.GetSavedAuthUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i51.GetThemeOptionUseCase>(
        () => _i51.GetThemeOptionUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i52.GetTransactionSummaryUsecase>(() =>
        _i52.GetTransactionSummaryUsecase(gh<_i14.TransactionRepository>()));
    gh.factory<_i53.GetUserProfileUsecase>(
        () => _i53.GetUserProfileUsecase(gh<_i20.UserProfileRepository>()));
    gh.factory<_i54.HomeBloc>(() => _i54.HomeBloc(
          gh<_i45.GetAccountsUsecase>(),
          gh<_i52.GetTransactionSummaryUsecase>(),
        ));
    gh.factory<_i55.IsDarkModeUseCase>(
        () => _i55.IsDarkModeUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i56.IsLightModeUseCase>(
        () => _i56.IsLightModeUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i57.LoginUsecase>(
        () => _i57.LoginUsecase(gh<_i33.AuthRepository>()));
    gh.factory<_i58.ProfileBloc>(
        () => _i58.ProfileBloc(gh<_i53.GetUserProfileUsecase>()));
    gh.factory<_i59.RefreshTokenUseCase>(
        () => _i59.RefreshTokenUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i60.RegisterUseCase>(
        () => _i60.RegisterUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i61.RemoveAuthUsecase>(
        () => _i61.RemoveAuthUsecase(gh<_i33.AuthRepository>()));
    gh.factory<_i62.SaveFontOptionUseCase>(
        () => _i62.SaveFontOptionUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i63.SaveLanguageOptionUseCase>(
        () => _i63.SaveLanguageOptionUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i64.SaveThemeOptionUseCase>(
        () => _i64.SaveThemeOptionUseCase(gh<_i11.SettingRepository>()));
    gh.factory<_i65.SaveUserUseCase>(
        () => _i65.SaveUserUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i66.TabbarBloc>(
        () => _i66.TabbarBloc(gh<_i16.DeeplinkHelper>()));
    gh.factory<_i67.ThemeBloc>(() => _i67.ThemeBloc(
          gh<_i51.GetThemeOptionUseCase>(),
          gh<_i64.SaveThemeOptionUseCase>(),
        ));
    gh.factory<_i68.TokenAuthenticationBloc>(() =>
        _i68.TokenAuthenticationBloc(gh<_i23.AccessTokenRemoveUseCase>()));
    gh.factory<_i69.AccountBloc>(() => _i69.AccountBloc(
          gh<_i39.CreateAccountUsecase>(),
          gh<_i47.GetCurrenciesUsecase>(),
        ));
    gh.factory<_i70.AuthBloc>(() => _i70.AuthBloc(
          gh<_i60.RegisterUseCase>(),
          gh<_i65.SaveUserUseCase>(),
          gh<_i57.LoginUsecase>(),
        ));
    gh.lazySingleton<_i71.AuthInterceptor>(() => registerModule.authInterceptor(
          gh<_i59.RefreshTokenUseCase>(),
          gh<_i8.RefreshTokenGetUseCase>(),
          gh<_i10.RefreshTokenSaveUseCase>(),
          gh<_i22.AccessTokenGetUseCase>(),
          gh<_i24.AccessTokenSaveUseCase>(),
          gh<_i23.AccessTokenRemoveUseCase>(),
        ));
    gh.factory<_i72.CreateTransactionBloc>(() => _i72.CreateTransactionBloc(
          gh<_i46.GetCategoriesUsecase>(),
          gh<_i45.GetAccountsUsecase>(),
          gh<_i40.CreateTransactionUsecase>(),
        ));
    gh.factory<_i73.FontsBloc>(() => _i73.FontsBloc(
          gh<_i48.GetFontOptionUseCase>(),
          gh<_i62.SaveFontOptionUseCase>(),
        ));
    gh.factory<_i74.MultiLanguageBloc>(() => _i74.MultiLanguageBloc(
          gh<_i49.GetLanguageOptionUseCase>(),
          gh<_i63.SaveLanguageOptionUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i75.RegisterModule {}
