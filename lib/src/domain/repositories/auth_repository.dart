import '../../core/resources/data_state.dart';
import '../../core/params/params.dart';
import '../entities/entities.dart';

abstract class AuthRepository {
  Future<DataState<Auth?>> login(
    final LoginRequestParams params,
  );

  Future<DataState<Auth?>> register(
    final RegisterRequestParams params,
  );

  Future<DataState<Auth?>> refreshToken(
    final RefreshTokenRequestParams params,
  );

  // Database methods
  Future<Auth?> getSavedAuth();

  Future<void> saveAuth(
    final Auth auth,
  );

  // Future<void> removeLogin();
}
