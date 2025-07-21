// lib/src/domain/usecases/refresh_token_usecase.dart
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/auth_repository.dart';

@injectable
class RefreshTokenUseCase
    implements UseCase<DataState<User?>, RefreshTokenRequestParams> {
  const RefreshTokenUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<DataState<User?>> call({
    required final RefreshTokenRequestParams params,
  }) {
    return _authRepository.refreshToken(params);
  }
}
