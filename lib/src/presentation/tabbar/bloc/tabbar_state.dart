part of 'tabbar_bloc.dart';

@immutable
abstract class TabbarState {}

class TabbarInitial extends TabbarState {}

class TabbarInProgress extends TabbarState {}

class TabBarChangeSuccess extends TabbarState {
  TabBarChangeSuccess({required this.index, required this.auth});

  final int index;

  final Auth? auth;
}

class TabBarFailure extends TabbarState {
  TabBarFailure(this.error);
  final ApiError? error;
}
