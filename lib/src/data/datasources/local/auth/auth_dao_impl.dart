import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user.dart';
import '../cache/hive/ez_cache.dart';
import '../key/keys.dart';
import 'auth_dao.dart';

@LazySingleton(as: UserDao)
class UserDaoImpl implements UserDao {
  UserDaoImpl(this._ezCache);
  final EZCache _ezCache;

  @override
  Future<User?> getSavedUser() async {
    return _ezCache.get(Keys.user);
  }

  @override
  Future<void> saveUser(final User user) async {
    return _ezCache.save(Keys.user, user);
  }

  @override
  Future<void> removeUser() async {
    return _ezCache.remove(Keys.user);
  }

  @override
  Future<void> saveHasAccount(final bool hasAccount) async {
    return _ezCache.save(Keys.hasAccount, hasAccount);
  }

  @override
  Future<bool?> getSavedHasAccount() async {
    return _ezCache.get(Keys.hasAccount);
  }
}
