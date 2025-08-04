import '../../core/resources/data_state.dart';
import '../../core/params/params.dart';
import '../entities/entities.dart';

abstract class UserProfileRepository {
  Future<DataState<UserProfile?>> getUserProfile(
    final GetUserProfileRequestParams params,
  );
}
