// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecase/usecase.dart';
import '../repositories/helper_repository.dart';

@lazySingleton
class RefreshTokenRemoveUseCase implements UseCase<void, void> {
  const RefreshTokenRemoveUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<void> call({final void params}) {
    return _helperRepository.removeRefreshToken();
  }
}
