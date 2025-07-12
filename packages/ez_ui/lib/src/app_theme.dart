import 'app_colors.dart';
import 'typography/typography.dart';
import 'package:flutter/material.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;

/// Namespace for the App [ThemeData].
class AppTheme {
  /// Standard `ThemeData` for App UI.
  static ThemeData get standard {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.white,
        backgroundColor: AppColors.white,
      ),
      appBarTheme: _appBarTheme(AppColors.primaryColor),
      elevatedButtonTheme: _elevatedButtonTheme(AppColors.white),
      outlinedButtonTheme: _outlinedButtonTheme(AppColors.white),
      textTheme: _textTheme,
      dialogBackgroundColor: AppColors.white,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme(AppColors.white),
      bottomSheetTheme: _bottomSheetTheme(AppColors.white),
      tabBarTheme: _tabBarTheme(
        AppColors.primaryColor,
        AppColors.primaryColor,
        AppColors.hintColor,
      ),
      dividerTheme: _dividerTheme(AppColors.dividerColor),
    );
  }

  /// Creating a new theme with the same properties as the standard theme, but
  /// with a different brightness.
  static ThemeData get dark {
    return standard.copyWith(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.dividerColor,
        errorColor: AppColors.errorColor,
      ),
      primaryColorLight: AppColors.primaryColorLight,
      hoverColor: AppColors.hoverColor,
      disabledColor: AppColors.lightGrey,
      dividerColor: AppColors.dividerColor,
      hintColor: AppColors.dividerColor,
      shadowColor: AppColors.shadowColor,
      cardColor: AppColors.dividerColor,
      unselectedWidgetColor: AppColors.unselectedWidgetColor,
    );
  }

  /// Creating a new theme with the same properties as the standard theme, but
  /// with a different brightness.
  static ThemeData get light {
    return standard.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.hintColor,
        actionsIconTheme: IconThemeData(color: AppColors.hintColor),
      ),
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.white,
        errorColor: AppColors.errorColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: _textTheme.bodySmall,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.hintColor),
        ),
      ),
      primaryColorLight: AppColors.primaryColorLight,
      hoverColor: AppColors.hoverColor,
      disabledColor: AppColors.lightGrey,
      dividerColor: AppColors.dividerColor,
      hintColor: AppColors.hintColor,
      focusColor: AppColors.success,
      shadowColor: AppColors.shadowColor,
      cardColor: AppColors.dividerColor,
      unselectedWidgetColor: AppColors.unselectedWidgetColor,
      primaryColorDark: AppColors.text,
      indicatorColor: AppColors.lightBlue,
    );
  }

  /// `ThemeData` for App UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for App UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for App UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineLarge: AppTextStyle.headlineLarge,
      headlineMedium: AppTextStyle.headlineMedium,
      headlineSmall: AppTextStyle.headlineSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
      labelLarge: AppTextStyle.labelLarge,
      labelMedium: AppTextStyle.labelMedium,
      labelSmall: AppTextStyle.labelSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      displayLarge: AppTextStyle.displayLarge.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * _smallTextScaleFactor,
      ),
      displayMedium: AppTextStyle.displayMedium.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * _smallTextScaleFactor,
      ),
      displaySmall: AppTextStyle.displaySmall.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * _smallTextScaleFactor,
      ),
      headlineMedium: AppTextStyle.headlineMedium.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * _smallTextScaleFactor,
      ),
      headlineSmall: AppTextStyle.headlineSmall.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * _smallTextScaleFactor,
      ),
      titleLarge: AppTextStyle.titleLarge.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * _smallTextScaleFactor,
      ),
      titleMedium: AppTextStyle.titleMedium.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * _smallTextScaleFactor,
      ),
      titleSmall: AppTextStyle.titleSmall.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * _smallTextScaleFactor,
      ),
      bodyLarge: AppTextStyle.bodyLarge.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * _smallTextScaleFactor,
      ),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * _smallTextScaleFactor,
      ),
      bodySmall: AppTextStyle.bodySmall.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * _smallTextScaleFactor,
      ),
      labelSmall: AppTextStyle.labelSmall.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * _smallTextScaleFactor,
      ),
      labelLarge: AppTextStyle.labelLarge.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      displayLarge: AppTextStyle.displayLarge.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * _largeTextScaleFactor,
      ),
      displayMedium: AppTextStyle.displayMedium.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * _largeTextScaleFactor,
      ),
      displaySmall: AppTextStyle.displaySmall.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * _largeTextScaleFactor,
      ),
      headlineMedium: AppTextStyle.headlineMedium.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * _largeTextScaleFactor,
      ),
      headlineSmall: AppTextStyle.headlineSmall.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * _largeTextScaleFactor,
      ),
      titleLarge: AppTextStyle.titleLarge.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * _largeTextScaleFactor,
      ),
      titleMedium: AppTextStyle.titleMedium.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * _largeTextScaleFactor,
      ),
      titleSmall: AppTextStyle.titleSmall.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * _largeTextScaleFactor,
      ),
      bodyLarge: AppTextStyle.bodyLarge.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * _largeTextScaleFactor,
      ),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * _largeTextScaleFactor,
      ),
      bodySmall: AppTextStyle.bodySmall.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * _largeTextScaleFactor,
      ),
      labelSmall: AppTextStyle.labelSmall.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * _largeTextScaleFactor,
      ),
      labelLarge: AppTextStyle.labelLarge.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * _largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme _appBarTheme(final Color color) {
    return AppBarTheme(color: color);
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(
    final Color primaryColor,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: primaryColor,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(
    final Color primaryColor,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: BorderSide(color: primaryColor, width: 2),
        foregroundColor: primaryColor,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData _tooltipTheme(final Color color) {
    return TooltipThemeData(
      decoration: const BoxDecoration(
        color: AppColors.dividerColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(10),
      textStyle: TextStyle(color: color),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(final Color backgroundColor) {
    return BottomSheetThemeData(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme _tabBarTheme(
    final Color borderSideColor,
    final Color labelColor,
    final Color unselectedLabelColor,
  ) {
    return TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: borderSideColor,
        ),
      ),
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      labelStyle: _textTheme.titleSmall,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData _dividerTheme(final Color color) {
    return DividerThemeData(
      space: 0,
      thickness: 1,
      color: color,
    );
  }
}
