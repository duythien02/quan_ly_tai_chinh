// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/logger/logger.dart';
import '../../../domain/usecases/setting/get_language_option_usecase.dart';
import '../../../domain/usecases/setting/save_language_option_usecase.dart';

part 'multi_language_event.dart';
part 'multi_language_state.dart';

@injectable
class MultiLanguageBloc extends Bloc<MultiLanguageEvent, MultiLanguageState> {
  MultiLanguageBloc(
    this._getLanguageOptionUseCase,
    this._saveLanguageOptionUseCase,
  ) : super(const MultiLanguageState(locale: Locale('vi'))) {
    on<MultiLanguageStarted>((final event, final emit) async {
      final locale = await _getLanguageOptionUseCase();
      emit(MultiLanguageState(locale: Locale(locale)));
    });

    on<MultiLanguageChanged>((final event, final emit) async {
      await AppLocalizations.delegate.load(event.locale);
      Log.info(
        'event.locale.languageCode ======== ${event.locale.languageCode}',
      );
      await _saveLanguageOptionUseCase(params: event.locale.languageCode);
      emit(MultiLanguageState(locale: event.locale));
    });
  }
  final GetLanguageOptionUseCase _getLanguageOptionUseCase;

  final SaveLanguageOptionUseCase _saveLanguageOptionUseCase;
}
