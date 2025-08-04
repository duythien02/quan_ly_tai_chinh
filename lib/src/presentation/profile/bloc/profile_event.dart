part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfileEvent extends ProfileEvent {
  const GetUserProfileEvent(
    this.params,
  );
  final GetUserProfileRequestParams params;

  @override
  List<Object> get props => [params];
}
