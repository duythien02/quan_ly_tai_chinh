part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeStarted extends ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged({
    required this.appThemeState,
  });
  final AppThemeMode appThemeState;
}
