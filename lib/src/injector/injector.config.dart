// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quan_ly_tai_chinh/src/core/utils/deeplink_helper.dart' as _i9;
import 'package:quan_ly_tai_chinh/src/core/utils/mappers.dart' as _i6;
import 'package:quan_ly_tai_chinh/src/data/datasources/local/cache/hive/ez_cache.dart'
    as _i3;
import 'package:quan_ly_tai_chinh/src/data/datasources/remote/auth_api_service.dart'
    as _i17;
import 'package:quan_ly_tai_chinh/src/data/repositories/auth_repository_impl.dart'
    as _i16;
import 'package:quan_ly_tai_chinh/src/data/repositories/helper_repository_impl.dart'
    as _i5;
import 'package:quan_ly_tai_chinh/src/data/repositories/setting_repository_impl.dart'
    as _i8;
import 'package:quan_ly_tai_chinh/src/domain/repositories/auth_repository.dart'
    as _i15;
import 'package:quan_ly_tai_chinh/src/domain/repositories/helper_repository.dart'
    as _i4;
import 'package:quan_ly_tai_chinh/src/domain/repositories/setting_repository.dart'
    as _i7;
import 'package:quan_ly_tai_chinh/src/domain/usecases/access_token_get_usecase.dart'
    as _i10;
import 'package:quan_ly_tai_chinh/src/domain/usecases/access_token_remove_usecase.dart'
    as _i11;
import 'package:quan_ly_tai_chinh/src/domain/usecases/access_token_save_usecase.dart'
    as _i12;
import 'package:quan_ly_tai_chinh/src/domain/usecases/app_version_get_usecase.dart'
    as _i13;
import 'package:quan_ly_tai_chinh/src/domain/usecases/app_version_save_usecase.dart'
    as _i14;
import 'package:quan_ly_tai_chinh/src/domain/usecases/device_info_get_usecase.dart'
    as _i19;
import 'package:quan_ly_tai_chinh/src/domain/usecases/device_info_save_usecase.dart'
    as _i20;
import 'package:quan_ly_tai_chinh/src/domain/usecases/firebase_token_get_usecase.dart'
    as _i21;
import 'package:quan_ly_tai_chinh/src/domain/usecases/firebase_token_save_usecase.dart'
    as _i22;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/get_font_option_usecase.dart'
    as _i23;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/get_language_option_usecase.dart'
    as _i24;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/get_theme_option_usecase.dart'
    as _i25;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/is_dark_mode_usecase.dart'
    as _i26;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/is_light_mode_usecase.dart'
    as _i27;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/save_font_option_usecase.dart'
    as _i28;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/save_language_option_usecase.dart'
    as _i29;
import 'package:quan_ly_tai_chinh/src/domain/usecases/setting/save_theme_option_usecase.dart'
    as _i30;
import 'package:quan_ly_tai_chinh/src/presentation/_blocs/authentication/token_authentication_bloc.dart'
    as _i18;
import 'package:quan_ly_tai_chinh/src/presentation/settings/fonts/fonts_bloc.dart'
    as _i32;
import 'package:quan_ly_tai_chinh/src/presentation/settings/multi_language/multi_language_bloc.dart'
    as _i33;
import 'package:quan_ly_tai_chinh/src/presentation/settings/theme/theme_bloc.dart'
    as _i31;

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
    gh.lazySingleton<_i3.EZCache>(() => _i3.EZCache());
    gh.lazySingleton<_i4.HelperRepository>(
        () => _i5.HelperRepositoryImpl(gh<_i3.EZCache>()));
    gh.lazySingleton<_i6.Mapper>(() => _i6.Mapper());
    gh.lazySingleton<_i7.SettingRepository>(
        () => _i8.SettingRepositoryImpl(cache: gh<_i3.EZCache>()));
    gh.lazySingleton<_i9.UniLinkHelper>(() => _i9.UniLinkHelper());
    gh.lazySingleton<_i10.AccessTokenGetUseCase>(
        () => _i10.AccessTokenGetUseCase(gh<_i4.HelperRepository>()));
    gh.lazySingleton<_i11.AccessTokenRemoveUseCase>(
        () => _i11.AccessTokenRemoveUseCase(gh<_i4.HelperRepository>()));
    gh.factory<_i12.AccessTokenSaveUseCase>(
        () => _i12.AccessTokenSaveUseCase(gh<_i4.HelperRepository>()));
    gh.lazySingleton<_i13.AppVersionGetUseCase>(
        () => _i13.AppVersionGetUseCase(gh<_i4.HelperRepository>()));
    gh.factory<_i14.AppVersionSaveUseCase>(
        () => _i14.AppVersionSaveUseCase(gh<_i4.HelperRepository>()));
    gh.lazySingleton<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
          gh<_i17.AuthApiService>(),
          gh<_i3.EZCache>(),
        ));
    gh.factory<_i18.TokenAuthenticationBloc>(() =>
        _i18.TokenAuthenticationBloc(gh<_i11.AccessTokenRemoveUseCase>()));
    gh.lazySingleton<_i9.DeeplinkHelper>(
        () => _i9.DeeplinkHelper(gh<_i9.UniLinkHelper>()));
    gh.lazySingleton<_i19.DeviceInfoGetUseCase>(
        () => _i19.DeviceInfoGetUseCase(gh<_i4.HelperRepository>()));
    gh.factory<_i20.DeviceInfoSaveUseCase>(
        () => _i20.DeviceInfoSaveUseCase(gh<_i4.HelperRepository>()));
    gh.lazySingleton<_i21.FirebaseTokenGetUseCase>(
        () => _i21.FirebaseTokenGetUseCase(gh<_i4.HelperRepository>()));
    gh.factory<_i22.FirebaseTokenSaveUseCase>(
        () => _i22.FirebaseTokenSaveUseCase(gh<_i4.HelperRepository>()));
    gh.factory<_i23.GetFontOptionUseCase>(
        () => _i23.GetFontOptionUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i24.GetLanguageOptionUseCase>(
        () => _i24.GetLanguageOptionUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i25.GetThemeOptionUseCase>(
        () => _i25.GetThemeOptionUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i26.IsDarkModeUseCase>(
        () => _i26.IsDarkModeUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i27.IsLightModeUseCase>(
        () => _i27.IsLightModeUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i28.SaveFontOptionUseCase>(
        () => _i28.SaveFontOptionUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i29.SaveLanguageOptionUseCase>(
        () => _i29.SaveLanguageOptionUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i30.SaveThemeOptionUseCase>(
        () => _i30.SaveThemeOptionUseCase(gh<_i7.SettingRepository>()));
    gh.factory<_i31.ThemeBloc>(() => _i31.ThemeBloc(
          gh<_i25.GetThemeOptionUseCase>(),
          gh<_i30.SaveThemeOptionUseCase>(),
        ));
    gh.factory<_i32.FontsBloc>(() => _i32.FontsBloc(
          gh<_i23.GetFontOptionUseCase>(),
          gh<_i28.SaveFontOptionUseCase>(),
        ));
    gh.factory<_i33.MultiLanguageBloc>(() => _i33.MultiLanguageBloc(
          gh<_i24.GetLanguageOptionUseCase>(),
          gh<_i29.SaveLanguageOptionUseCase>(),
        ));
    return this;
  }
}
