// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/bloc/ez_bloc.dart';
import '../../../domain/usecases/setting/get_font_option_usecase.dart';
import '../../../domain/usecases/setting/save_font_option_usecase.dart';

// Project imports:

part 'fonts_event.dart';
part 'fonts_state.dart';

@injectable
class FontsBloc extends Bloc<FontsEvent, FontsState> {
  FontsBloc(this._getFontOptionUseCase, this._saveFontOptionUseCase)
      : super(const FontsState()) {
    on<FontsStarted>((final event, final emit) async {
      final fontIndex = await _getFontOptionUseCase();
      emit(
        FontsState(
          fontData: AppFonts.appFontData.values.toList()[fontIndex],
        ),
      );
    });

    on<FontsChanged>((final event, final emit) async {
      final fontIndex = event.fontEnum?.index ?? 0;
      await _saveFontOptionUseCase(params: fontIndex);
      emit(
        FontsState(
          fontData: AppFonts.appFontData.values.toList()[fontIndex],
        ),
      );
    });
  }
  final GetFontOptionUseCase _getFontOptionUseCase;

  final SaveFontOptionUseCase _saveFontOptionUseCase;
}
