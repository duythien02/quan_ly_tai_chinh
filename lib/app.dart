// Dart imports:
// import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:in_app_notification/in_app_notification.dart';
// import 'package:oktoast/oktoast.dart';

// Project imports:
import 'src/core/app_strings.dart';
import 'src/core/bloc/ez_bloc.dart';
import 'src/core/network/ez_network.dart';
import 'src/core/routes/app_router.dart';
import 'src/core/utils/app_media_query.dart';
import 'src/core/utils/status_bar_color.dart';
import 'src/data/datasources/local/cache/hive/ez_cache.dart';
import 'src/injector/injector.dart';
import 'src/presentation/_blocs/app_multi_bloc_provider.dart';
import 'src/presentation/_blocs/authentication/token_authentication_bloc.dart';
import 'src/presentation/settings/fonts/fonts_bloc.dart';
import 'src/presentation/settings/multi_language/multi_language_bloc.dart';
import 'src/presentation/settings/theme/theme_bloc.dart';

class Main extends StatefulWidget {
  const Main({final Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((final _) async {
    //   await FireBaseService.listeners(
    //     FirebaseListenersParams(
    //       // mobile do not use vapidKey
    //       vapidKey: Defines.cloudMessagingVapidKey,
    //       handleNotification: (final message, {required final isBackground}) =>
    //           FirebaseHelper.handleNotification(
    //         context,
    //         message,
    //         isBackground: isBackground,
    //       ),
    //       onTokenReceived: FirebaseHelper.saveFirebaseToken,
    //       log: Log.info,
    //     ),
    //   );
    // });
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: AppMultiBlocProvider.providers,
      child: MultiBlocListener(
        listeners: [
          BlocListener<ThemeBloc, ThemeState>(
            listener: (final context, final state) {},
          ),
          BlocListener<FontsBloc, FontsState>(
            listener: (final context, final state) {},
          ),
          BlocListener<MultiLanguageBloc, MultiLanguageState>(
            listener: (final context, final state) {},
          ),
          BlocListener<TokenAuthenticationBloc, TokenAuthenticationState>(
            listener: (final context, final state) async {
              if (state is TokenAuthenticationUnAuthenticated) {
                getIt<AppRouter>().replaceAll([const AuthRoute()]);
              }
              if (state is TokenAuthenticationAuthenticated) {
                final hasAccount =
                    await getIt<EZCache>().userDao.getSavedHasAccount();
                if (hasAccount ?? false) {
                  getIt<AppRouter>().replaceAll([const HomeRoute()]);
                } else {
                  getIt<AppRouter>().replaceAll([const InitAccountRoute()]);
                }
              }
            },
            child: Container(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (final context, final child) {
        return MaterialApp.router(
          title: AppStrings.title,
          debugShowCheckedModeBanner: false,
          builder: (final context, final child) {
            if (child == null) {
              return const SizedBox.shrink();
            }

            return AppMediaQuery(
              // showBanner: Config.isDebug,
              text: getIt<Network>().environment.name,
              child: child,
            );
          },
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale(context),
          theme: _theme(context),
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(appRouter),
        );
      },
    );
  }
}

Locale? _locale(final BuildContext context) {
  final localeData = context.watch<MultiLanguageBloc>().state.locale;

  return localeData;
}

ThemeData? _theme(final BuildContext context) {
  final fontData = context.watch<FontsBloc>().state.fontData;
  final themeData = context.watch<ThemeBloc>().state.themeData;

  setStatusBarColor(
    context,
    useWhiteForeground:
        context.watch<ThemeBloc>().state.themeData == AppTheme.dark,
  );

  return themeData?.copyWith(
    primaryTextTheme: fontData,
    textTheme: fontData,
  );
}
