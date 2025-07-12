part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent(this.params);
  final LoginRequestParams params;
}

class AuthRegisterEvent extends AuthEvent {
  AuthRegisterEvent(this.params);
  final RegisterRequestParams params;
}
