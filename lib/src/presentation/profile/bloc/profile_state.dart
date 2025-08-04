part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class GetUserProfileSuccess extends ProfileState {
  const GetUserProfileSuccess(
    this.userProfile,
  );
  final UserProfile userProfile;

  @override
  List<Object> get props => [userProfile];
}

final class GetUserProfileFailure extends ProfileState {
  const GetUserProfileFailure(
    this.message,
  );
  final String message;

  @override
  List<Object> get props => [message];
}
