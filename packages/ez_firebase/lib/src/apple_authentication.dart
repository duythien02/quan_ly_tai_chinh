// Dart imports:
import 'dart:convert';
import 'dart:math';

// Package imports:
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Project imports:
import 'firebase_authentication.dart';

class AppleAuthentication implements FirebaseAuthentication {
  factory AppleAuthentication() {
    return instance;
  }

  AppleAuthentication._internal();
  static final AppleAuthentication instance = AppleAuthentication._internal();

  @override
  Future<UserCredential?> signIn() async {
    try {
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`,
      // sign in will fail.
      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final isSignedIn = FirebaseAuth.instance.currentUser != null;

      return isSignedIn;
    } catch (_) {
      return false;
    }
  }
}

/// Generates a cryptographically secure random nonce, to be included in a
/// credential request.
String generateNonce([final int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();

  return List.generate(
    length,
    (final _) => charset[random.nextInt(charset.length)],
  ).join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(final String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);

  return digest.toString();
}
