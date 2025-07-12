abstract class FirebaseAuthentication {
  /// Perform a signing In action
  /// Returns [data] if signed in successfully or else return [null]
  Future<dynamic> signIn();

  /// Sign out current user from firebase auth
  /// Returns [true] if successfully signed out or else return [false]
  Future<bool> signOut();

  /// Check current log in status of current user
  /// Returns [true] if currently signed in or else return [false]
  Future<bool> isLoggedIn();
}
