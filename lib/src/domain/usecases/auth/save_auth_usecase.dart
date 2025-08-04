import 'package:injectable/injectable.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/auth_repository.dart';

@injectable
class SaveUserUseCase implements UseCase<void, Auth> {
  SaveUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> call({required final Auth params}) {
    return _authRepository.saveAuth(params);
  }
}
