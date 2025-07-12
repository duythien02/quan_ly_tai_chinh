// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Project imports:
import '../../data/datasources/local/key/keys.dart';
import '../../domain/usecases/app_version_save_usecase.dart';
import '../../domain/usecases/device_info_save_usecase.dart';
import '../../injector/injector.dart';
import '../app_strings.dart';
import '../config/defines/defines.dart';
import '../logger/logger.dart';
import '../models/device_info.dart';

class Utils {
  // mobile platforms: android, ios
  static bool get isMobilePlatforms {
    if (kIsWeb) {
      return false;
    }

    return Platform.isAndroid || Platform.isIOS;
  }

  // common platforms: web, android, ios
  static bool get isCommonPlatforms {
    if (kIsWeb) {
      return true;
    }

    return isMobilePlatforms;
  }

  static bool get isIOS {
    if (isMobilePlatforms) {
      return Platform.isIOS;
    }

    return false;
  }

  static bool get isAndroid {
    if (isMobilePlatforms) {
      return Platform.isAndroid;
    }

    return false;
  }

  static Future<bool> get isAboveAndroid13 async {
    if (isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;

      return deviceInfo.version.sdkInt > 32;
    }

    return false;
  }

  static void redirectToStore() {
    try {
      if (Platform.isIOS) {
        unawaited(launchUrlString(Defines.appStoreUrl));
      } else if (Platform.isAndroid) {
        unawaited(launchUrlString(Defines.chPlayUrl));
      }
    } catch (e) {
      Log.info('redirectToStore error: $e');
    }
  }

  static String nullSafety(
    final String? value, {
    final String orElse = '',
  }) =>
      value ?? orElse;

  static String completePreAlertTitle(
    final BuildContext context,
    final String permissionText,
  ) {
    return '$permissionText ${context.l10n.onTheNextScreen}';
  }

  static Future<DeviceInfoModel?> deviceInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final deviceInfo = DeviceInfoPlugin();
      if (kIsWeb) {
        final webBrowserInfo = await deviceInfo.webBrowserInfo;

        return DeviceInfoModel(
          Keys.web,
          webBrowserInfo.userAgent,
          packageInfo.version,
          AppStrings.nothing,
        );
      } else {
        if (Platform.isIOS) {
          final iosDeviceInfo = await deviceInfo.iosInfo;

          return DeviceInfoModel(
            Platform.operatingSystem,
            iosDeviceInfo.systemVersion,
            packageInfo.version,
            iosDeviceInfo.identifierForVendor,
          );
        } else {
          final androidDeviceInfo = await deviceInfo.androidInfo;

          return DeviceInfoModel(
            Platform.operatingSystem,
            androidDeviceInfo.version.release,
            packageInfo.version,
            androidDeviceInfo.id,
          );
        }
      }
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveDeviceInfo() async {
    final saveDeviceInfoUseCase = getIt<DeviceInfoSaveUseCase>();
    final saveAppVersionUseCase = getIt<AppVersionSaveUseCase>();
    final deviceInfo = await Utils.deviceInfo();
    if (deviceInfo != null) {
      await saveDeviceInfoUseCase(params: deviceInfo.toJson());
      await saveAppVersionUseCase(params: deviceInfo.appVersion);
    }
  }

  static Color? textColorByAppBarTheme(final BuildContext context) {
    return Theme.of(context).appBarTheme.titleTextStyle?.color ??
        Theme.of(context).textTheme.bodyLarge?.color;
  }

  static T? getData<T>(final dynamic value) {
    if (value is T?) {
      return value;
    } else {
      if (T.toString().contains('List') && value is! List) {
        try {
          // ignore: avoid_dynamic_calls
          final items = value.items ?? [];

          return items as T?;
        } catch (_) {}
      }
    }

    return null;
  }
}
