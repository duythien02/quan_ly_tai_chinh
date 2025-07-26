// Package imports:
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/auth_repository.dart';

@injectable
class RegisterUseCase
    implements UseCase<DataState<Auth?>, RegisterRequestParams> {
  RegisterUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<DataState<Auth?>> call({
    required final RegisterRequestParams params,
  }) {
    return _authRepository.register(params);
  }
}
