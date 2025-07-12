part of 'multi_language_bloc.dart';

abstract class MultiLanguageEvent {
  const MultiLanguageEvent();
}

class MultiLanguageStarted extends MultiLanguageEvent {}

class MultiLanguageChanged extends MultiLanguageEvent {
  const MultiLanguageChanged({required this.locale});

  final Locale locale;
}
