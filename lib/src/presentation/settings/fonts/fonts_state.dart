part of 'fonts_bloc.dart';

@immutable
class FontsState extends Equatable {
  const FontsState({this.fontData});

  final TextTheme? fontData;
  @override
  List<Object?> get props => [fontData];
}
