import '../app_colors.dart';
import 'typography.dart';
import 'package:flutter/widgets.dart';

/// App Text Style Definitions
class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: 'Roboto',
    color: AppColors.text,
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle get displayLarge {
    return _baseTextStyle.copyWith(
      fontSize: 57,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get displayMedium {
    return _baseTextStyle.copyWith(
      fontSize: 45,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get displaySmall {
    return _baseTextStyle.copyWith(
      fontSize: 36,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get headlineLarge {
    return _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get headlineMedium {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get headlineSmall {
    return _baseTextStyle.copyWith(
      fontSize: 26,
      fontWeight: AppFontWeight.bold,
    );
  }

  static TextStyle get titleLarge {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get titleMedium {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get titleSmall {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get labelLarge {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get labelMedium {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get labelSmall {
    return _baseTextStyle.copyWith(
      fontSize: 11,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get bodyMedium {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get bodySmall {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: AppFontWeight.regular,
    );
  }
}
