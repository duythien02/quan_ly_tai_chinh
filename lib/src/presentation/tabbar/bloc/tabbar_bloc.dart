// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/error/api_error.dart';
import '../../../core/utils/deeplink_helper.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/auth/get_saved_auth_usecase.dart';
import '../../../injector/injector.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

@injectable
class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc(this._deeplinkHelper) : super(TabbarInitial()) {
    on<TabbarStarted>(_tabbarStarted);
    on<TabBarChangedIndex>(_tabbarIndexChangeHandler);
  }

  final DeeplinkHelper _deeplinkHelper;
  StreamSubscription? _deepLinkStreamSubscription;
  Auth? auth;
  @override
  Future<void> close() async {
    _deepLinkStreamSubscription?.cancel();
    super.close();
  }

  Future<void> _tabbarStarted(
    final TabbarStarted event,
    final Emitter<TabbarState> emit,
  ) async {
    emit(TabbarInProgress());

    _deeplinkHelper.handleInitialUri();

    _deepLinkStreamSubscription = _deeplinkHelper.handleIncomingLinks();

    auth = await getIt<GetSavedAuthUseCase>().call();

    emit(TabBarChangeSuccess(index: 0, auth: auth));
  }

  Future<void> _tabbarIndexChangeHandler(
    final TabBarChangedIndex event,
    final Emitter<TabbarState> emit,
  ) async {
    emit(TabbarInProgress());

    emit(TabBarChangeSuccess(index: event.index, auth: auth));
  }
}
