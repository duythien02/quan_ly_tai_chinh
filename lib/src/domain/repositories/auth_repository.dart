import '../../core/resources/data_state.dart';
import '../../core/params/params.dart';
import '../entities/login.dart';
import '../entities/register.dart';

abstract class AuthRepository {
  Future<DataState<Login?>> login(
    final LoginRequestParams params,
  );

  Future<DataState<Register?>> register(
    final RegisterRequestParams params,
  );

  Future<void> saveRegister(final Register register);

  // Future<DataState<UserEntity?>> getMe();
}
