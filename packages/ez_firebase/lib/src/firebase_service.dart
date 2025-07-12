// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Project imports:
import 'firebase_listeners_params.dart';

class FireBaseService {
  static Future<void> init() async {
    if (!kIsWeb) {
      await Firebase.initializeApp();
      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      // see reports while in debug mode
      return FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
  }

  static Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack,
  ) {
    if (!kIsWeb) {
      return FirebaseCrashlytics.instance
          .recordError(exception, stack, fatal: true);
    }

    return Future.value();
  }

  static Future<void> listeners(final FirebaseListenersParams params) async {
    if (!kIsWeb) {
      // Handle when app was killed by system
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
      await firebaseCloudMessagingListeners(
        FirebaseListenersParams(
          vapidKey: params.vapidKey,
          handleNotification: params.handleNotification,
          onTokenReceived: params.onTokenReceived,
          log: params.log,
        ),
      );
    }
  }

  static Future<void> firebaseCloudMessagingListeners(
    final FirebaseListenersParams params,
  ) async {
    if (kIsWeb) {
      return;
    }
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    String? token;
    if (Platform.isIOS) {
      token = await messaging.getAPNSToken();
      if (token == null) {
        await Future<void>.delayed(
          const Duration(seconds: 1),
        );
        token = await messaging.getAPNSToken();
      }
    }
    token = await messaging.getToken(
      vapidKey: params.vapidKey,
    );
    params.log
        ?.call('User granted permission: ${settings.authorizationStatus}');
    params.log?.call('Firebase token: $token');

    params.onTokenReceived.call(token);

    FirebaseMessaging.onMessage.listen((final message) {
      params.log?.call('Got a message whilst in the foreground!');
      params.log?.call('Message: $message');

      params.handleNotification.call(message, isBackground: false);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((final message) {
      params.log?.call('Got a message whilst in the background!');
      params.log?.call('Message: $message');

      params.handleNotification.call(message, isBackground: true);
    });
    await FirebaseMessaging.instance.getInitialMessage().then((final message) {
      params.log?.call('Message: $message');
      if (message != null) {
        params.handleNotification.call(message, isBackground: true);
      }
    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async {
  // If you're going to use other Firebase services in the background,
  // such as Fire Store,
  // make sure you call `initializeApp` before using other Firebase services.
  await FireBaseService.init();
  // log?.call('Handling a background message ${msg.messageId}');
}
