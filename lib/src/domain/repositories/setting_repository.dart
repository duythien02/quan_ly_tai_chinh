abstract class SettingRepository {
  Future<int> getFontOption();

  Future<void> saveFontOption(final int fontIndex);

  Future<int> getThemeOption();

  Future<bool> get isDarkMode;

  Future<bool> get isLightMode;

  Future<void> saveThemeOption(final int themeIndex);

  Future<String> getLanguageOption();

  Future<void> saveLanguageOption(final String languageIndex);
}
