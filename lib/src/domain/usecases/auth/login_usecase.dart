// Package imports:
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

@injectable
class LoginUsecase implements UseCase<DataState<User?>, LoginRequestParams> {
  LoginUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<DataState<User?>> call({
    required final LoginRequestParams params,
  }) {
    return _authRepository.login(params);
  }
}
