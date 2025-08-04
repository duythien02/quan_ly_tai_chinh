import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/user_profile_repository.dart';

@injectable
class GetUserProfileUsecase
    implements UseCase<DataState<UserProfile?>, GetUserProfileRequestParams> {
  GetUserProfileUsecase(this._userProfileRepository);
  final UserProfileRepository _userProfileRepository;

  @override
  Future<DataState<UserProfile?>> call({
    required final GetUserProfileRequestParams params,
  }) async {
    return _userProfileRepository.getUserProfile(params);
  }
}
