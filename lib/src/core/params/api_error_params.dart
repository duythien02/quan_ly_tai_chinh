// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../error/api_error.dart';

class ApiErrorParams {
  ApiErrorParams(
    this.context,
    this.error, {
    this.acceptButtonTitle,
    this.acceptButton,
    this.onPressOK,
    this.title = '',
    this.isPop = true,
  });

  final BuildContext context;
  final ApiError? error;
  final String? acceptButtonTitle;
  final String? acceptButton;
  final String title;
  final Function? onPressOK;
  final bool isPop;
}
