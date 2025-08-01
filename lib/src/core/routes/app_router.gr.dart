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
      return CupertinoPageX<void>(
        routeData: routeData,
        child: const AuthPage(),
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
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthRoute';
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
