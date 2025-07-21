import 'package:injectable/injectable.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/auth_repository.dart';

@injectable
class SaveUserUseCase implements UseCase<void, User> {
  SaveUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> call({required final User params}) {
    return _authRepository.saveUser(params);
  }
}
