import '../../core/resources/data_state.dart';
import '../../core/params/params.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<DataState<User?>> login(
    final LoginRequestParams params,
  );

  Future<DataState<User?>> register(
    final RegisterRequestParams params,
  );

  Future<DataState<User?>> refreshToken(
    final RefreshTokenRequestParams params,
  );

  // Database methods
  // Future<Login?> getSavedLogin();

  Future<void> saveUser(
    final User auth,
  );

  // Future<void> removeLogin();
}
