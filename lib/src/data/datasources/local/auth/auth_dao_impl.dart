import 'package:injectable/injectable.dart';

import '../../../../domain/entities/entities.dart';
import '../cache/hive/ez_cache.dart';
import '../key/keys.dart';
import 'auth_dao.dart';

@LazySingleton(as: AuthDao)
class AuthDaoImpl implements AuthDao {
  AuthDaoImpl(this._ezCache);
  final EZCache _ezCache;

  @override
  Future<Auth?> getSavedAuth() async {
    return _ezCache.get(Keys.authLogin);
  }

  @override
  Future<void> saveAuth(final Auth auth) async {
    return _ezCache.save(Keys.authLogin, auth);
  }

  @override
  Future<void> removeAuth() async {
    return _ezCache.remove(Keys.authLogin);
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
