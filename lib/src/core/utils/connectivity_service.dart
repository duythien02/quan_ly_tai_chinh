// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Project imports:
import '../../injector/injector.dart';
import '../routes/app_router.dart';
import '../routes/routes.dart';

// Flutter imports:

class ConnectivityService {
  ConnectivityService({required this.handleNoneNetwork});

  final void Function() handleNoneNetwork;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool previousConnection = true;
  Future<void> listenNetworkEvent() async {
    final connectivity = Connectivity();
    await connectivity.checkConnectivity();
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> stop() {
    return _connectivitySubscription.cancel();
  }

  Future<void> _updateConnectionStatus(final ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      previousConnection = false;
      handleNoneNetwork();
    }
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      if (!previousConnection) {
        final currentContext = getIt<AppRouter>().navigatorKey.currentContext;
        if (currentContext != null) {
          if (!currentContext.mounted) {
            return;
          }
          // if (currentContext.router.current.path == Routes.offlineCheckin) {
          //   Navigator.of(currentContext).pop();
          // }
        }
      }
    }
  }
}
