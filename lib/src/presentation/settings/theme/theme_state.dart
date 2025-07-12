part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState(
    this.themeData, {
    required this.isDarkMode,
  });

  final ThemeData? themeData;

  final bool isDarkMode;

  @override
  List<Object?> get props => [themeData];
}
