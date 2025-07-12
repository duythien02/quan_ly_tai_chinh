// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

class DoubleBack extends StatelessWidget {
  const DoubleBack({
    required this.child,
    this.message = 'Press BACK again to back',
    super.key,
  });

  final Widget child;
  final String message;

  @override
  Widget build(final BuildContext context) {
    DateTime currentBackPressTime = DateTime.now();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (final _, final __) {
        final now = DateTime.now();
        if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
          currentBackPressTime = now;
          unawaited(
            Fluttertoast.showToast(
              msg: message,
              toastLength: Toast.LENGTH_SHORT,
            ),
          );

          return;
        }
        unawaited(SystemNavigator.pop());

        return;
      },
      child: child,
    );
  }
}
