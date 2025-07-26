import 'package:injectable/injectable.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/auth_repository.dart';

@injectable
class GetSavedAuthUseCase implements UseCase<Auth?, void> {
  GetSavedAuthUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Auth?> call({final void params}) {
    return _authRepository.getSavedAuth();
  }
}
