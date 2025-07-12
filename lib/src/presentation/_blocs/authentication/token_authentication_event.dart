part of 'token_authentication_bloc.dart';

@immutable
abstract class TokenAuthenticationEvent {}

class TokenAuthenticationStarted extends TokenAuthenticationEvent {}

class TokenAuthenticationLoggedIn extends TokenAuthenticationEvent {}

class TokenAuthenticationLoggedOut extends TokenAuthenticationEvent {}
