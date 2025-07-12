// Flutter imports:
import 'package:flutter/material.dart';

class AlertParams {
  const AlertParams(
    this.context, {
    this.title,
    this.confirmText,
    this.msg,
    this.content,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.backgroundColor,
    this.isPop = true,
  });
  final BuildContext context;
  final String? title;
  final String? msg;
  final Widget? content;
  final String? confirmText;
  final String? cancelText;
  final Color? backgroundColor;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isPop;
}

class ModalConfirmParams {
  ModalConfirmParams(
    this.context, {
    required this.titleAlert,
    required this.confirmText,
    required this.actionAccept,
    required this.message,
  });

  final BuildContext context;
  final String titleAlert;
  final String confirmText;
  final String message;
  final void Function() actionAccept;
}

class AlertConfirmParams {
  AlertConfirmParams(
    this.context, {
    this.title,
    this.confirmText,
    this.message,
    required this.onPressed,
  });

  final BuildContext context;
  final String? title;
  final String? confirmText;
  final String? message;
  final void Function() onPressed;
}

class AlertWithImageParams {
  AlertWithImageParams(
    this.context, {
    this.title,
    this.message,
    required this.image,
    required this.onPressed,
    this.closeButton,
    this.closeButtonStyle,
  });
  final BuildContext context;
  final String? title;
  final String? message;
  final Widget image;
  final VoidCallback onPressed;
  final String? closeButton;
  final TextStyle? closeButtonStyle;
}
