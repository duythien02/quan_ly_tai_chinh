// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'config.dart';
import 'src/core/app_core.dart';
import 'src/core/bloc/ez_bloc.dart';
import 'src/core/config/orientations/app_orientations.dart';
import 'src/core/logger/logger.dart';
import 'src/core/routes/app_router.dart';
import 'src/core/utils/utils.dart';
import 'src/core/widgets/widgets.dart';
import 'src/injector/injector.dart';
import 'services.dart';

Future<void> bootstrap({
  required final Environment env,
  required final FutureOr<Widget> Function() builder,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Services.run();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (final errorDetails) {
    Log.error(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by
  // the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (final error, final stack) {
    Log.error(error);

    return true;
  };

  getIt.registerSingleton<AppRouter>(AppRouter());

  configureDependencies();

  await AppCore.run(environment: env);

  ErrorWidget.builder = (final flutterErrorDetails) => BaseErrorWidget(
        detailsException: flutterErrorDetails.exception,
      );
  await SystemChrome.setPreferredOrientations(AppOrientations.orientations());

  Bloc.observer = EZBlocObserver();

  // custom flutter error widget
  await setup();

  runApp(await builder());
  // app behaviors after app completely running
  appStarted();
}

Future<void> appStarted() async {
  // ConnectivityService(
  //   handleNoneNetwork: () {
  //     getIt<AppRouter>().pushNamed(Routes.offlineCheckin);
  //   },
  // ).listenNetworkEvent();
}

Future<void> setup() async {
  // custom flutter error widget
  customErrorWidget();
  // support app orientation
  await SystemChrome.setPreferredOrientations(
    AppOrientations.orientations(),
  );

  await Utils.saveDeviceInfo();
}

void customErrorWidget() {
  ErrorWidget.builder = (final flutterErrorDetails) => BaseErrorWidget(
        detailsException: flutterErrorDetails.exception,
      );
}
