// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecase/usecase.dart';
import '../repositories/helper_repository.dart';

@lazySingleton
class AccessTokenGetUseCase implements UseCase<String, void> {
  const AccessTokenGetUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<String> call({final void params}) {
    return _helperRepository.accessToken;
  }
}
