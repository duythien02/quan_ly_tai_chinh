// Project imports:
import '../../core/bloc/ez_bloc.dart';
import '../../injector/injector.dart';
import '../settings/fonts/fonts_bloc.dart';
import '../settings/multi_language/multi_language_bloc.dart';
import '../settings/theme/theme_bloc.dart';
import 'authentication/token_authentication_bloc.dart';

class AppMultiBlocProvider {
  static List<BlocProvider> get providers {
    return [
      BlocProvider<ThemeBloc>(
        create: (final context) => getIt<ThemeBloc>()..add(ThemeStarted()),
      ),
      BlocProvider<FontsBloc>(
        create: (final context) => getIt<FontsBloc>()..add(FontsStarted()),
      ),
      BlocProvider<MultiLanguageBloc>(
        create: (final context) =>
            getIt<MultiLanguageBloc>()..add(MultiLanguageStarted()),
      ),
      BlocProvider<TokenAuthenticationBloc>(
        create: (final context) =>
            getIt<TokenAuthenticationBloc>()..add(TokenAuthenticationStarted()),
      ),
    ];
  }
}
