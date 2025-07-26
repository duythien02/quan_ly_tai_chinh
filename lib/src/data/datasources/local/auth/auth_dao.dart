import '../../../../domain/entities/entities.dart';

abstract class AuthDao {
  Future<Auth?> getSavedAuth();

  Future<void> saveAuth(final Auth auth);

  Future<void> removeAuth();

  Future<void> saveHasAccount(final bool hasAccount);

  Future<bool?> getSavedHasAccount();
}
