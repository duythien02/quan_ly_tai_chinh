// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecase/usecase.dart';
import '../repositories/helper_repository.dart';

@lazySingleton
class AccessTokenRemoveUseCase implements UseCase<void, void> {
  const AccessTokenRemoveUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<void> call({final void params}) {
    return _helperRepository.removeAccessToken();
  }
}
