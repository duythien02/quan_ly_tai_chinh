// ignore_for_file: avoid_print

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_darwin/local_auth_darwin.dart';

class Authentication {
  Authentication._();

  static LocalAuthentication auth = LocalAuthentication();

  // ignore: long-parameter-list
  static Future<bool> authenticate({
    final String? cancelButton,
    final String? goToSettingsButton,
    final String? goToSettingsDescription,
    final String? lockOut,
    final String? fingerprintHint,
    final String? signInTitle,
    final String localizedReason = ' ',
    final String? fingerprintSuccess,
    final String? fingerprintRequiredTitle,
    final String? fingerprintNotRecognized,
  }) async {
    var authenticated = false;

    // final iosStrings = IOSAuthMessages(
    //   cancelButton: cancelButton,
    //   goToSettingsButton: goToSettingsButton,
    //   goToSettingsDescription: goToSettingsDescription,
    //   lockOut: lockOut,
    // );

    final androidStrings = AndroidAuthMessages(
      biometricSuccess: fingerprintSuccess,
      biometricRequiredTitle: fingerprintRequiredTitle,
      biometricNotRecognized: fingerprintNotRecognized,
      cancelButton: cancelButton,
      goToSettingsButton: goToSettingsButton,
      goToSettingsDescription: goToSettingsDescription,
      biometricHint: fingerprintHint,
      signInTitle: signInTitle,
    );

    try {
      authenticated = await auth.authenticate(
        localizedReason: localizedReason,
        authMessages: <AuthMessages>[
          // iosStrings,
          androidStrings,
        ],
      );
    } on PlatformException catch (e) {
      print(e);
    }

    return authenticated;
  }

  Future<void> cancelAuthentication() => auth.stopAuthentication();

  static Future<bool> checkBiometrics() async {
    var canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    return canCheckBiometrics;
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    var availableBiometrics = <BiometricType>[];
    try {
      if (!kIsWeb) {
        availableBiometrics = await auth.getAvailableBiometrics();
      }
    } on PlatformException catch (e) {
      print(e);
    }

    return availableBiometrics;
  }
}
