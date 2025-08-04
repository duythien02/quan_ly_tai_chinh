// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const LandingPage(),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return CupertinoPageX<void>(
        routeData: routeData,
        child: AuthPage(
          key: args.key,
          showLoginPageFirst: args.showLoginPageFirst,
        ),
      );
    },
    InitAccountRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const InitAccountPage(),
      );
    },
    TabBarRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const TabBarPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    CreateTransactionRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const CreateTransactionPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    UnknownRouteRoute.name: (routeData) {
      final args = routeData.argsAs<UnknownRouteRouteArgs>(
          orElse: () => const UnknownRouteRouteArgs());
      return CupertinoPageX<void>(
        routeData: routeData,
        child: UnknownRoutePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    OnboardingRouteOne.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const OnboardingScreenOne(),
      );
    },
    OnboardingRouteTwo.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const OnboardingScreenTwo(),
      );
    },
    OnboardingRouteThree.name: (routeData) {
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const OnboardingScreenThree(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LandingRoute.name,
          path: '/',
        ),
        RouteConfig(
          AuthRoute.name,
          path: '/auth',
        ),
        RouteConfig(
          InitAccountRoute.name,
          path: '/initAccount',
        ),
        RouteConfig(
          TabBarRoute.name,
          path: '/tabbar',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          CreateTransactionRoute.name,
          path: '/createTransaction',
        ),
        RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        RouteConfig(
          UnknownRouteRoute.name,
          path: '/unknown',
        ),
        RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding',
        ),
        RouteConfig(
          OnboardingRouteOne.name,
          path: '/onboardingOne',
        ),
        RouteConfig(
          OnboardingRouteTwo.name,
          path: '/onboardingTwo',
        ),
        RouteConfig(
          OnboardingRouteThree.name,
          path: '/onboardingThree',
        ),
        RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/unknown',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    bool showLoginPageFirst = true,
  }) : super(
          AuthRoute.name,
          path: '/auth',
          args: AuthRouteArgs(
            key: key,
            showLoginPageFirst: showLoginPageFirst,
          ),
        );

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.showLoginPageFirst = true,
  });

  final Key? key;

  final bool showLoginPageFirst;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, showLoginPageFirst: $showLoginPageFirst}';
  }
}

/// generated route for
/// [InitAccountPage]
class InitAccountRoute extends PageRouteInfo<void> {
  const InitAccountRoute()
      : super(
          InitAccountRoute.name,
          path: '/initAccount',
        );

  static const String name = 'InitAccountRoute';
}

/// generated route for
/// [TabBarPage]
class TabBarRoute extends PageRouteInfo<void> {
  const TabBarRoute()
      : super(
          TabBarRoute.name,
          path: '/tabbar',
        );

  static const String name = 'TabBarRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CreateTransactionPage]
class CreateTransactionRoute extends PageRouteInfo<void> {
  const CreateTransactionRoute()
      : super(
          CreateTransactionRoute.name,
          path: '/createTransaction',
        );

  static const String name = 'CreateTransactionRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [UnknownRoutePage]
class UnknownRouteRoute extends PageRouteInfo<UnknownRouteRouteArgs> {
  UnknownRouteRoute({
    Key? key,
    String? route,
  }) : super(
          UnknownRouteRoute.name,
          path: '/unknown',
          args: UnknownRouteRouteArgs(
            key: key,
            route: route,
          ),
        );

  static const String name = 'UnknownRouteRoute';
}

class UnknownRouteRouteArgs {
  const UnknownRouteRouteArgs({
    this.key,
    this.route,
  });

  final Key? key;

  final String? route;

  @override
  String toString() {
    return 'UnknownRouteRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [OnboardingScreenOne]
class OnboardingRouteOne extends PageRouteInfo<void> {
  const OnboardingRouteOne()
      : super(
          OnboardingRouteOne.name,
          path: '/onboardingOne',
        );

  static const String name = 'OnboardingRouteOne';
}

/// generated route for
/// [OnboardingScreenTwo]
class OnboardingRouteTwo extends PageRouteInfo<void> {
  const OnboardingRouteTwo()
      : super(
          OnboardingRouteTwo.name,
          path: '/onboardingTwo',
        );

  static const String name = 'OnboardingRouteTwo';
}

/// generated route for
/// [OnboardingScreenThree]
class OnboardingRouteThree extends PageRouteInfo<void> {
  const OnboardingRouteThree()
      : super(
          OnboardingRouteThree.name,
          path: '/onboardingThree',
        );

  static const String name = 'OnboardingRouteThree';
}
