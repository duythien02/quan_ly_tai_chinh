import 'package:injectable/injectable.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/auth_repository.dart';

@injectable
class RemoveAuthUsecase implements UseCase<void, void> {
  RemoveAuthUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> call({final void params}) {
    return _authRepository.removeAuth();
  }
}
