// Package imports:
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'firebase_authentication.dart';
import 'google_sign_in_params.dart';

class GoogleAuthentication implements FirebaseAuthentication {
  factory GoogleAuthentication() {
    return instance;
  }

  GoogleAuthentication._internal();
  static final GoogleAuthentication instance = GoogleAuthentication._internal();
  GoogleSignIn? _googleSignIn;

  @override
  Future<bool> isLoggedIn() async {
    try {
      final isSignedIn = await _googleSignIn?.isSignedIn();

      return isSignedIn ?? false;
    } catch (_) {
      return false;
    }
  }

  // need to setup OAuth consent screen to use this func
  @override
  Future<GoogleSignInAccount?> signIn({
    final GoogleSignInParams? params,
  }) async {
    if (params == null) {
      return null;
    }

    _googleSignIn = GoogleSignIn(
      signInOption: params.signInOption,
      scopes: params.scope,
      hostedDomain: params.hostedDomain,
      clientId: params.clientId,
    );

    try {
      return await _googleSignIn?.signIn();
    } catch (error) {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    if (_googleSignIn == null) {
      return false;
    }
    try {
      await _googleSignIn?.signOut();

      return true;
    } catch (error) {
      return false;
    }
  }
}
