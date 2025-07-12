// Package imports:
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Project imports:
import 'firebase_authentication.dart';

class FacebookAuthentication implements FirebaseAuthentication {
  factory FacebookAuthentication() {
    return instance;
  }
  FacebookAuthentication._internal();
  static final FacebookAuthentication instance =
      FacebookAuthentication._internal();

  @override
  Future<bool> isLoggedIn() async {
    final isSignedIn = await FacebookAuth.instance.accessToken != null;

    return isSignedIn;
  }

  // need to setup OAuth consent screen to use this func
  @override
  Future<AccessToken?> signIn() async {
    try {
      final result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken;

        return accessToken;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await FacebookAuth.instance.logOut();

      return true;
    } catch (_) {
      return false;
    }
  }
}
