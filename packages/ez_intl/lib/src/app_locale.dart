import 'package:flutter/material.dart';

class AppLocale {
  static const String vi = 'vi';
  static const String en = 'en';

  static final Map<String, String> supportedLanguageMap = <String, String>{
    vi: 'Tiếng Việt',
    en: 'English',
  };
  static const Locale localeVi = Locale(vi);
  static const Locale localeEn = Locale(en);
}
