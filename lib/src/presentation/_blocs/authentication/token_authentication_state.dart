part of 'token_authentication_bloc.dart';

@immutable
abstract class TokenAuthenticationState {}

class TokenAuthenticationInitial extends TokenAuthenticationState {}

class TokenAuthenticationInProgress extends TokenAuthenticationState {}

class TokenAuthenticationUnAuthenticated extends TokenAuthenticationState {}

class TokenAuthenticationAuthenticated extends TokenAuthenticationState {}
