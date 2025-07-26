part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {
  const AuthRegisterSuccess(this.auth);

  final Auth auth;

  @override
  List<Object> get props => [auth];
}

final class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess(this.auth);

  final Auth auth;

  @override
  List<Object> get props => [auth];
}

final class AuthHasAccount extends AuthState {}

final class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
