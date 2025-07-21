import '../../../../domain/entities/user.dart';

abstract class UserDao {
  Future<User?> getSavedUser();

  Future<void> saveUser(final User user);

  Future<void> removeUser();

  Future<void> saveHasAccount(final bool hasAccount);

  Future<bool?> getSavedHasAccount();
}
