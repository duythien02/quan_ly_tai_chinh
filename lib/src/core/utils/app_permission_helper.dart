// Dart imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_permission/ez_permission.dart';

// Project imports:
import '../app_strings.dart';
import 'utils.dart';

class AppPermissionHelper {
  static Future<bool> requestStoragePermission(
    final BuildContext context, {
    final PreAlertParams? params,
  }) async {
    final isNewAndroid = await Utils.isAboveAndroid13;

    return EZPermission.request(
      context,
      params ??
          PreAlertParams(
            title: Utils.completePreAlertTitle(
              context,
              context.l10n.requestStoragePermission +
                  AppStrings.space +
                  context.l10n.storageRequest1,
            ),
            note: context.l10n.changeSettingsLater,
            confirmText: context.l10n.continuous,
            desc: [
              PreAlertItem(desc: context.l10n.storageRequest1),
            ],
          ),
      EZPermissionParams(
        permission: isNewAndroid ? Permission.photos : Permission.storage,
      ),
    );
  }

  static Future<bool> requestPhotosPermission(
    final BuildContext context,
  ) async {
    final isNewAndroid = await Utils.isAboveAndroid13;

    return EZPermission.request(
      context,
      PreAlertParams(
        title: Utils.completePreAlertTitle(
          context,
          context.l10n.requestPermissionLibrary +
              AppStrings.space +
              context.l10n.photoRequest1,
        ),
        note: context.l10n.changeSettingsLater,
        confirmText: context.l10n.continuous,
        desc: [
          PreAlertItem(desc: context.l10n.photoRequest1),
        ],
      ),
      EZPermissionParams(
        permission: isNewAndroid || Utils.isIOS
            ? Permission.photos
            : Permission.storage,
      ),
    );
  }

  static Future<bool> requestCameraPermission(final BuildContext context) {
    return EZPermission.request(
      context,
      PreAlertParams(
        title: Utils.completePreAlertTitle(
          context,
          context.l10n.requestPermissionCamera,
        ),
        note: context.l10n.changeSettingsLater,
        confirmText: context.l10n.continuous,
        desc: [
          PreAlertItem(desc: context.l10n.cameraRequest1),
          PreAlertItem(desc: context.l10n.cameraRequest2),
        ],
      ),
      EZPermissionParams(
        permission: Permission.camera,
      ),
    );
  }

  static Future<bool> requestRecorderPermission(final BuildContext context) {
    return EZPermission.request(
      context,
      PreAlertParams(
        title: Utils.completePreAlertTitle(
          context,
          context.l10n.microPermissionRequest +
              AppStrings.space +
              context.l10n.microRequest2,
        ),
        note: context.l10n.changeSettingsLater,
        confirmText: context.l10n.continuous,
        desc: [
          PreAlertItem(desc: context.l10n.microRequest1),
          PreAlertItem(desc: context.l10n.microRequest2),
        ],
      ),
      EZPermissionParams(
        permission: Permission.microphone,
      ),
    );
  }
}
