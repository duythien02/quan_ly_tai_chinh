part of 'fonts_bloc.dart';

@immutable
abstract class FontsEvent {
  const FontsEvent();
}

class FontsStarted extends FontsEvent {}

class FontsChanged extends FontsEvent {
  const FontsChanged({this.fontEnum});

  final AppFontType? fontEnum;
}
