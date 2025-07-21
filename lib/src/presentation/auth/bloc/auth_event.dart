part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  AuthLoginRequested(this.params);
  final LoginRequestParams params;
}

class AuthRegisterRequested extends AuthEvent {
  AuthRegisterRequested(this.params);
  final RegisterRequestParams params;
}

class AuthInitAccount extends AuthEvent {}
