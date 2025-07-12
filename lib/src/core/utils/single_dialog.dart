// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../params/alert_params.dart';
import '../params/singleton_dialog_params.dart';
import 'alert.dart';

class SingletonAlertDialog {
  SingletonAlertDialog._internal();

  static final SingletonAlertDialog instance = SingletonAlertDialog._internal();

  bool isShowing = false;

  void resetStateDialog() {
    isShowing = false;
  }

  Future<void> show(
    final BuildContext context,
    final String? msg,
    final SingletonDialogParams params,
  ) async {
    if (isShowing) {
      return;
    }
    isShowing = true;
    await Alert.showAlert(
      AlertParams(
        context,
        msg: msg,
        title: params.title,
        onConfirm: () {
          isShowing = false;
          if (params.onPressOK != null) {
            params.onPressOK?.call();
          }
        },
        isPop: params.isPop,
      ),
    );
    isShowing = false;
  }
}
