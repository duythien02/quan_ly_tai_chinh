import '../../../../domain/entities/entities.dart';

abstract class UserProfileDao {
  Future<UserProfile?> getSavedUserProfile();

  Future<void> saveUserProfile(final UserProfile userProfile);

  Future<void> removeUserProfile();
}
