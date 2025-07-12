// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle style = SystemUiOverlayStyle.dark;

void setStatusBarColor(
  final BuildContext context, {
  final Color? statusBarColor,
  final bool useWhiteForeground = false,
  final Color? navigationBarColor,
}) {
  if (Platform.isAndroid) {
    style = style.copyWith(
      statusBarIconBrightness:
          useWhiteForeground ? Brightness.light : Brightness.dark,
      statusBarBrightness:
          useWhiteForeground ? Brightness.dark : Brightness.light,
    );
  }

  if (Platform.isIOS) {
    style = style.copyWith(
      statusBarBrightness:
          useWhiteForeground ? Brightness.dark : Brightness.light,
    );
  }

  style = style.copyWith(
    statusBarColor: statusBarColor ??
        (useWhiteForeground
            ? Theme.of(context).textTheme.bodyLarge?.color
            : Theme.of(context).scaffoldBackgroundColor),
    systemNavigationBarColor: navigationBarColor,
  );

  SystemChrome.setSystemUIOverlayStyle(
    style,
  );
}

void setStatusBarWhiteForeground({required final bool useWhiteForeground}) {
  if (Platform.isAndroid) {
    style = style.copyWith(
      statusBarIconBrightness:
          useWhiteForeground ? Brightness.dark : Brightness.light,
    );
  }

  if (Platform.isIOS) {
    style = style.copyWith(
      statusBarBrightness:
          useWhiteForeground ? Brightness.light : Brightness.dark,
    );
  }

  SystemChrome.setSystemUIOverlayStyle(style);
}

void setNavigationBarColor(final Color color) {
  style = style.copyWith(
    systemNavigationBarColor: color,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}
