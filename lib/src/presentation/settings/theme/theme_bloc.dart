// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/enums/app_theme_mode.dart';
import '../../../domain/usecases/setting/get_theme_option_usecase.dart';
import '../../../domain/usecases/setting/save_theme_option_usecase.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this._getThemeOptionUseCase, this._saveThemeOptionUseCase)
      : super(ThemeState(AppTheme.light, isDarkMode: false)) {
    on<ThemeStarted>((final event, final emit) async {
      final mode = await _getThemeOptionUseCase();
      emit(_getThemeState(mode));
    });

    on<ThemeChanged>((final event, final emit) async {
      final index = event.appThemeState.index;
      await _saveThemeOptionUseCase(params: index);
      emit(_getThemeState(index));
    });
  }

  final GetThemeOptionUseCase _getThemeOptionUseCase;

  final SaveThemeOptionUseCase _saveThemeOptionUseCase;

  ThemeState _getThemeState(final int index) {
    final themeState = AppThemeMode.values[index];

    return ThemeState(
      themeState == AppThemeMode.light ? AppTheme.light : AppTheme.dark,
      isDarkMode: index == AppThemeMode.dark.index,
    );
  }
}
