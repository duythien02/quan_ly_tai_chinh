part of 'tabbar_bloc.dart';

@immutable
abstract class TabbarEvent {}

class TabbarStarted extends TabbarEvent {}

class TabBarChangedIndex extends TabbarEvent {
  TabBarChangedIndex({required this.index});

  final int index;
}
