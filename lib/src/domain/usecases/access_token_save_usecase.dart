// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecase/usecase.dart';
import '../repositories/helper_repository.dart';

@injectable
class AccessTokenSaveUseCase implements UseCase<void, String?> {
  const AccessTokenSaveUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<void> call({required final String? params}) {
    return _helperRepository.saveAccessToken(params);
  }
}
