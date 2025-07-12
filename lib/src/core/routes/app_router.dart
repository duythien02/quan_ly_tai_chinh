// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import '../../presentation/auth/auth_page.dart';
import '../../presentation/home_page/home_page.dart';
import '../../presentation/landing_page/landing_page.dart';
import '../widgets/unknown_route_page.dart';
import 'routes.dart';

// Project imports:

part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(
      page: LandingPage,
      path: Routes.landing,
      initial: true,
    ),
    AutoRoute<void>(
      page: AuthPage,
      path: Routes.auth,
    ),
    AutoRoute<void>(
      page: HomePage,
      path: Routes.home,
    ),
    AutoRoute<void>(
      path: Routes.unknown,
      page: UnknownRoutePage,
    ),
    RedirectRoute(path: '*', redirectTo: Routes.unknown),
  ],
)
class AppRouter extends _$AppRouter {}

class InheritedParamScreen extends StatelessWidget {
  const InheritedParamScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Container();
  }
}
