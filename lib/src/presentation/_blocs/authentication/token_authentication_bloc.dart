// Package imports:
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

// Project imports:
import '../../../data/datasources/local/cache/hive/ez_cache.dart';
import '../../../data/datasources/local/key/keys.dart';
import '../../../domain/usecases/access_token_remove_usecase.dart';
import '../../../injector/injector.dart';

part 'token_authentication_event.dart';
part 'token_authentication_state.dart';

@injectable
class TokenAuthenticationBloc
    extends Bloc<TokenAuthenticationEvent, TokenAuthenticationState> {
  TokenAuthenticationBloc(
    // this._accessTokenGetUseCase,
    this._accessTokenRemoveUseCase,
  ) : super(TokenAuthenticationInitial()) {
    on<TokenAuthenticationStarted>(_onAppStartHandler);
    on<TokenAuthenticationLoggedIn>(_onLoggedInHandler);
    on<TokenAuthenticationLoggedOut>(_onLoggedOutHandler);
  }

  final AccessTokenRemoveUseCase _accessTokenRemoveUseCase;

  Future<void> _onAppStartHandler(
    final TokenAuthenticationStarted event,
    final Emitter<TokenAuthenticationState> emit,
  ) async {
    emit(TokenAuthenticationInProgress());
    final accessToken =
        (await getIt<EZCache>().get<String?>(Keys.accessToken)) ?? '';
    if (accessToken.isNotEmpty) {
      emit(TokenAuthenticationAuthenticated());
    } else {
      emit(TokenAuthenticationUnAuthenticated());
    }
  }

  Future<void> _onLoggedInHandler(
    final TokenAuthenticationLoggedIn event,
    final Emitter<TokenAuthenticationState> emit,
  ) async {
    emit(TokenAuthenticationInProgress());
    emit(TokenAuthenticationAuthenticated());
  }

  Future<void> _onLoggedOutHandler(
    final TokenAuthenticationLoggedOut event,
    final Emitter<TokenAuthenticationState> emit,
  ) async {
    emit(TokenAuthenticationInProgress());
    await _accessTokenRemoveUseCase();
    await getIt<EZCache>().clearAllCache();
    emit(TokenAuthenticationUnAuthenticated());
  }
}
