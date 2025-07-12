// Package imports:
// import 'package:ez_firebase/ez_firebase.dart';

// Project imports:
// import 'firebase_options.dart';

class Services {
  /// run services before app started
  static Future<void> run() async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // do not send reports while in debug mode
    // return FirebaseCrashlytics.instance
    //     .setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  /// record error and pass it via firebase crashlytics
  static Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack,
  ) async {
    // return EzFireBase.recordError(exception, stack);
  }
}
