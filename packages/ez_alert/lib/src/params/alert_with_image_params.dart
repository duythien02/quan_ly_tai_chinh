// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class EzAlertWithImageParams {
  EzAlertWithImageParams({
    this.title,
    this.message,
    required this.image,
    required this.onPressed,
    required this.closeButton,
    this.closeButtonStyle,
  });

  final String? title;
  final String? message;
  final Widget image;
  final VoidCallback onPressed;
  final String closeButton;
  final TextStyle? closeButtonStyle;
}
