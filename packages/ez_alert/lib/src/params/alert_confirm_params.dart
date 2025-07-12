import 'package:flutter/cupertino.dart';

class EzAlertConfirmParams {
  EzAlertConfirmParams(
    this.context, {
    this.title,
    required this.confirmText,
    required this.cancelText,
    this.message,
    required this.onPressed,
  });

  final BuildContext context;
  final String? title;
  final String confirmText;
  final String cancelText;
  final String? message;
  final void Function() onPressed;
}
