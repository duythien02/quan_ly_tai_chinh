// Flutter imports:
import 'package:flutter/material.dart';

class EzAlertParams {
  const EzAlertParams({
    required this.title,
    required this.confirmText,
    required this.msg,
    this.content,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.backgroundColor,
    this.isPop = true,
  });
  final String title;
  final String msg;
  final Widget? content;
  final String confirmText;
  final String? cancelText;
  final Color? backgroundColor;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isPop;
}
