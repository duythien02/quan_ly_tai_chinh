// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'loading_view.dart';

class LoadingDialog {
  static bool isShowing = false;

  static void show(final BuildContext context) {
    isShowing = !isShowing;

    unawaited(
      showDialog<void>(
        context: context,
        builder: (final BuildContext context) {
          return PopScope(
            canPop: false,
            child: loadingView(context),
          );
        },
      ),
    );
  }

  static void hide(final BuildContext context) {
    if (isShowing) {
      isShowing = false;
      Navigator.of(context).pop();
    }
  }
}
