part of 'multi_language_bloc.dart';

class MultiLanguageState extends Equatable {
  const MultiLanguageState({
    required this.locale,
  });

  final Locale locale;

  @override
  List<Object> get props => [locale];
}
