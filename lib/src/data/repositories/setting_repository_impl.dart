// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/enums/app_theme_mode.dart';
import '../../domain/repositories/setting_repository.dart';
import '../datasources/local/cache/hive/ez_cache.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  SettingRepositoryImpl({required this.cache});

  final EZCache cache;

  @override
  Future<int> getFontOption() {
    return cache.fontOption;
  }

  @override
  Future<void> saveFontOption(final int fontIndex) {
    return cache.saveFontOption(fontIndex);
  }

  @override
  Future<int> getThemeOption() {
    return cache.themeOption;
  }

  @override
  Future<bool> get isDarkMode async {
    final mode = await getThemeOption();

    return AppThemeMode.dark.index == mode;
  }

  @override
  Future<bool> get isLightMode async {
    return !(await isDarkMode);
  }

  @override
  Future<void> saveThemeOption(final int themeIndex) {
    return cache.saveThemeOption(themeIndex);
  }

  @override
  Future<String> getLanguageOption() async {
    return cache.languageOption;
  }

  @override
  Future<void> saveLanguageOption(final String languageIndex) {
    return cache.saveLanguageOption(languageIndex);
  }
}
