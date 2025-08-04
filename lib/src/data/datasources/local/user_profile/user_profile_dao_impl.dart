import 'package:injectable/injectable.dart';

import '../../../../domain/entities/entities.dart';
import '../cache/hive/ez_cache.dart';
import '../key/keys.dart';
import 'user_profile_dao.dart';

@Injectable(as: UserProfileDao)
class UserProfileDaoImpl implements UserProfileDao {
  UserProfileDaoImpl(this._ezCache);
  final EZCache _ezCache;

  @override
  Future<UserProfile?> getSavedUserProfile() async {
    return _ezCache.get(Keys.userProfile);
  }

  @override
  Future<void> saveUserProfile(final UserProfile userProfile) async {
    return _ezCache.save(Keys.userProfile, userProfile);
  }

  @override
  Future<void> removeUserProfile() async {
    return _ezCache.remove(Keys.userProfile);
  }
}
