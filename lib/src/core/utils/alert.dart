// Dart imports:

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_alert/ez_alert.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_permission/ez_permission.dart';

// Project imports:
import '../params/alert_params.dart';
import 'utils.dart';

class Alert {
  static Future<void> networkError(
    final BuildContext context, {
    required final String connectionError,
    required final String? acceptButton,
  }) {
    return showAlert(
      AlertParams(
        context,
        msg: connectionError,
        confirmText: acceptButton,
      ),
    );
  }

  static Future<void> showForceUpdate(
    final BuildContext context,
    final String message,
  ) {
    return showAlert(
      AlertParams(
        context,
        msg: message,
        onConfirm: Utils.redirectToStore,
        isPop: false,
      ),
    );
  }

  static Future<void> showAlert(
    final AlertParams params,
  ) {
    return EzAlert.showAlert(
      params.context,
      EzAlertParams(
        confirmText: params.confirmText ?? params.context.l10n.accept,
        msg: params.msg ?? params.context.l10n.unknown,
        content: params.content,
        title: params.title ?? params.context.l10n.notification,
        cancelText: params.cancelText,
        onConfirm: params.onConfirm,
        onCancel: params.onCancel,
        backgroundColor: params.backgroundColor,
        isPop: params.isPop,
      ),
    );
  }

  static void popup(final BuildContext context, final Widget widget) {
    EzAlert.popup(context, widget);
  }

  static void showModalConfirm(
    final ModalConfirmParams params,
  ) {
    EzAlert.showAlertConfirm(
      EzAlertConfirmParams(
        params.context,
        title: params.titleAlert,
        confirmText: params.confirmText,
        onPressed: params.actionAccept,
        cancelText: params.context.l10n.cancel,
      ),
    );
  }

  static void showAlertConfirm(
    final ModalConfirmParams params,
  ) {
    EzAlert.showAlertConfirm(
      EzAlertConfirmParams(
        params.context,
        message: params.message,
        cancelText: params.context.l10n.cancel,
        confirmText: params.confirmText,
        onPressed: params.actionAccept,
        title: params.titleAlert,
      ),
    );
  }

  static void showAlertSetting(
    final BuildContext context,
    final String message, {
    final String? title,
    final String? closeButton,
    final String? openSettingButton,
  }) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (final BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              title ?? context.l10n.notification,
              style: const TextStyle(fontSize: 16),
            ),
            content: Text(message),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  closeButton ?? context.l10n.close,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                child: Text(
                  openSettingButton ?? context.l10n.openSettings,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static void showAlertWithImage(
    final AlertWithImageParams params,
  ) {
    EzAlert.showAlertWithImage(
      params.context,
      EzAlertWithImageParams(
        title: params.title,
        message: params.message,
        image: params.image,
        onPressed: params.onPressed,
        closeButton: params.closeButton ?? params.context.l10n.close,
        closeButtonStyle: params.closeButtonStyle,
      ),
    );
  }

  static void showAlertWithImageTwo(
    final AlertWithImageParams params,
  ) {
    EzAlert.showAlertWithImageTwo(
      params.context,
      EzAlertWithImageParams(
        title: params.title,
        message: params.message,
        image: params.image,
        onPressed: params.onPressed,
        closeButton: params.closeButton ?? params.context.l10n.close,
        closeButtonStyle: params.closeButtonStyle,
      ),
    );
  }

  static void showSuccess(
    final BuildContext context,
    final String message,
    final IconData icon,
  ) {
    EzAlert.showSuccess(context, message, icon);
  }

  static void showSettings(
    final BuildContext context, {
    required final String permission,
    required final String purpose,
  }) {
    EzAlert.showSettings(
      context,
      cancelBtnText: context.l10n.notNow,
      confirmBtnText: context.l10n.openSettings,
      permission: permission,
      purpose: purpose,
    );
  }

  static void showSettingCamera(final BuildContext context) {
    return showSettings(
      context,
      permission: context.l10n.settingTitle(context.l10n.camera),
      purpose: context.l10n.settingMessage(context.l10n.camera) +
          context.l10n.cameraRequest1 +
          context.l10n.cameraRequest2,
    );
  }

  static void showSettingPhotoLibrary(final BuildContext context) {
    return showSettings(
      context,
      permission: context.l10n.settingTitle(context.l10n.photoLibrary),
      purpose: context.l10n.settingMessage(context.l10n.photoLibrary) +
          context.l10n.photoRequest1,
    );
  }

  static void showSettingMicro(final BuildContext context) {
    return showSettings(
      context,
      permission: context.l10n.settingTitle(context.l10n.micro),
      purpose: context.l10n.settingMessage(context.l10n.micro) +
          context.l10n.microRequest1 +
          context.l10n.microRequest2,
    );
  }

  static void showSettingLocation(final BuildContext context) {
    return showSettings(
      context,
      permission: context.l10n.settingTitle(context.l10n.location),
      purpose: context.l10n.settingMessage(context.l10n.location),
    );
  }

  static void showSettingStorage(final BuildContext context) {
    return showSettings(
      context,
      permission: context.l10n.settingTitle(context.l10n.file),
      purpose: context.l10n.settingMessage(context.l10n.file),
    );
  }
}
