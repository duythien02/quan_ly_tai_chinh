import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../data/datasources/local/cache/hive/ez_cache.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/user_profile/get_user_profile_usecase.dart';
import '../../../injector/injector.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getUserProfileUsecase) : super(ProfileInitial()) {
    on<GetUserProfileEvent>(_onGetUserProfileEvent);
  }

  final GetUserProfileUsecase _getUserProfileUsecase;

  Future<void> _onGetUserProfileEvent(
    final GetUserProfileEvent event,
    final Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final userProfile =
        await getIt<EZCache>().userProfileDao.getSavedUserProfile();
    if (userProfile != null) {
      emit(GetUserProfileSuccess(userProfile));
      return;
    }
    final data = await _getUserProfileUsecase(
      params: event.params,
    );
    if (data is DataSuccess && data.data != null) {
      await getIt<EZCache>().userProfileDao.saveUserProfile(data.data!);
      emit(GetUserProfileSuccess(data.data!));
    } else {
      emit(GetUserProfileFailure(data.error?.message ?? 'Unknown error'));
    }
  }
}
