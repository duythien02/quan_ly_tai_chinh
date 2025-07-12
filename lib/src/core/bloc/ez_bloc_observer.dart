// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class EZBlocObserver extends BlocObserver {
  @override
  void onCreate(final BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(final Bloc<dynamic, dynamic> bloc, final Object? event) {
    super.onEvent(bloc, event);
    debugPrint('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(final BlocBase<dynamic> bloc, final Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(
    final Bloc<dynamic, dynamic> bloc,
    final Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    debugPrint('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(
    final BlocBase<dynamic> bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(final BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
  }
}
