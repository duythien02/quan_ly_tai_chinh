// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:animations/animations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';

// Project imports:
import 'params/alert_confirm_params.dart';
import 'params/alert_params.dart';
import 'params/alert_with_image_params.dart';
import 'helper.dart';

class EzAlert {
  static Future<void> networkError(
    final BuildContext context, {
    required final String connectionError,
    required final String acceptButton,
    required final String title,
  }) {
    return showAlert(
      context,
      EzAlertParams(
        msg: connectionError,
        title: title,
        confirmText: acceptButton,
      ),
    );
  }

  static Future<void> showForceUpdate(
    final BuildContext context, {
    required String message,
    required String title,
    required String confirmText,
    required String appStoreUrl,
    required String playStoreUrl,
  }) {
    return showAlert(
      context,
      EzAlertParams(
        msg: message,
        title: title,
        confirmText: confirmText,
        onConfirm: () => Helper.redirectToStore(
            appStoreUrl: appStoreUrl, playStoreUrl: playStoreUrl),
        isPop: false,
      ),
    );
  }

  static Future<void> showAlert(
    final BuildContext context,
    final EzAlertParams params,
  ) {
    // set up the button

    return showDialog<void>(
      context: context,
      builder: (final BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            titlePadding: const EdgeInsets.only(top: 6),
            contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            actionsPadding: EdgeInsets.zero,
            title: Text(
              params.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            content: params.content ??
                Text(
                  params.msg,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
            actions: [
              TextButton(
                onPressed: () {
                  if (params.isPop) {
                    Navigator.of(context).pop();
                  }
                  params.onConfirm?.call();
                },
                child: Text(
                  params.cancelText ?? 'Close',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static void popup(final BuildContext context, final Widget widget) {
    unawaited(
      showDialog<dynamic>(
        context: context,
        builder: (final BuildContext context) {
          return widget;
        },
      ),
    );
  }

  static void showAlertConfirm(
    final EzAlertConfirmParams params,
  ) {
    bool hasTitle() => params.title?.isNotEmpty ?? false;
    unawaited(
      showModal<void>(
        configuration: const FadeScaleTransitionConfiguration(
          barrierDismissible: false,
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 200),
        ),
        context: params.context,
        builder: (final BuildContext context) {
          return CupertinoAlertDialog(
            title: hasTitle()
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      params.title ?? '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  )
                : const SizedBox.shrink(),
            content: SizedBox(
              height: hasTitle() ? null : 54,
              child: Center(
                child: Text(
                  params.message ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            actions: <Widget>[
              _buildCancelButton(context, params.cancelText),
              CupertinoDialogAction(
                onPressed: params.onPressed,
                child: Text(
                  params.confirmText,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static CupertinoDialogAction _buildCancelButton(
      final BuildContext context, final String cancelButtonText) {
    return CupertinoDialogAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        cancelButtonText,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Theme.of(context).hintColor),
      ),
    );
  }

  static void showAlertWithImage(
    final BuildContext context,
    final EzAlertWithImageParams params,
  ) {
    unawaited(
      showModal<void>(
        configuration: const FadeScaleTransitionConfiguration(
          barrierDismissible: false,
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 200),
        ),
        context: context,
        builder: (final BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              params.title ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            content: Column(
              children: <Widget>[
                params.image,
                const SizedBox(height: 10.0),
                Text(
                  params.message ?? '',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: params.onPressed,
                child: Text(
                  params.closeButton,
                  style: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static void showAlertWithImageTwo(
    final BuildContext context,
    final EzAlertWithImageParams params,
  ) {
    unawaited(
      showModal<void>(
        configuration: const FadeScaleTransitionConfiguration(
          barrierDismissible: false,
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 200),
        ),
        context: context,
        builder: (final BuildContext context) {
          return PopScope(
            canPop: false,
            child: CupertinoAlertDialog(
              content: Column(
                children: <Widget>[
                  params.image,
                  const SizedBox(height: 10.0),
                  Text(
                    params.title ?? '',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: params.onPressed,
                  child: Text(
                    params.closeButton,
                    style: params.closeButtonStyle ??
                        TextStyle(
                          color: Theme.of(context).splashColor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static void showSuccess(
    final BuildContext context,
    final String message,
    final IconData icon,
  ) {
    unawaited(
      showModal<void>(
        configuration: const FadeScaleTransitionConfiguration(
          barrierDismissible: false,
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 200),
        ),
        context: context,
        builder: (final BuildContext context) => Center(
          child: Material(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).splashColor,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Theme.of(context).focusColor,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    message,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.surface),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void showSettings(
    final BuildContext context, {
    required final String permission,
    required final String purpose,
    required final String confirmBtnText,
    required final String cancelBtnText,
  }) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (final BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              permission,
              style: const TextStyle(fontSize: 16),
            ),
            content: Text(
              purpose,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                child: Text(
                  confirmBtnText,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  cancelBtnText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static void quickAlert(
    BuildContext context, {
    required String? title,
    required String? message,
    required String confirmBtnText,
    required QuickAlertType type,
  }) {
    QuickAlert.show(
        context: context,
        type: type,
        title: title,
        text: message,
        confirmBtnText: confirmBtnText,
        confirmBtnColor: Theme.of(context).primaryColor);
  }

  static void customQuickAlert(
    BuildContext context, {
    required String? title,
    required String? message,
    required String confirmBtnText,
    required String cancelBtnText,
    String? customAsset,
    Widget? widget,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.custom,
        title: title,
        text: message,
        confirmBtnText: confirmBtnText,
        confirmBtnColor: Theme.of(context).primaryColor,
        customAsset: customAsset,
        widget: widget ?? Container(),
        cancelBtnText: cancelBtnText,
        onConfirmBtnTap: onConfirmBtnTap,
        onCancelBtnTap: onCancelBtnTap,
        showCancelBtn: cancelBtnText.isNotEmpty);
  }

  static void confirmQuickAlert(
    BuildContext context, {
    required String? title,
    required String? message,
    required String confirmBtnText,
    required String cancelBtnText,
    void Function()? onConfirmBtnTap,
  }) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        title: title,
        text: message,
        confirmBtnText: confirmBtnText,
        cancelBtnText: cancelBtnText,
        onConfirmBtnTap: onConfirmBtnTap,
        confirmBtnColor: Theme.of(context).primaryColor);
  }
}
