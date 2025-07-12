// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/services.dart';
// import 'package:home_widget/home_widget.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:uni_links/uni_links.dart';

// Project imports:
import '../../domain/usecases/access_token_get_usecase.dart';
import '../../injector/injector.dart';
import '../logger/logger.dart';
import '../routes/app_router.dart';
import '../routes/routes.dart';
import 'tabbar_helpers.dart';
import 'utils.dart';

Future<void> _handleRoute(final String path) async {
  final accessToken = await getIt<AccessTokenGetUseCase>()();
  if (accessToken.isNotEmpty && path.isNotEmpty) {
    // handle route to tab bar pages
    // if (Routes.tabBarPages.contains(path)) {
    //   _handleRouteToTabBarPages(path);
    // }
    // // handle route to screen
    // else {
    //   getIt<AppRouter>().popUntilRoot();
    //   await getIt<AppRouter>().pushNamed(path);
    // }
  }
}

// void _handleRouteToTabBarPages(final String screenName) {
//   tabBarOnIndexChange(Routes.tabBarPages.indexOf(screenName));
// }

@lazySingleton
class DeeplinkHelper {
  DeeplinkHelper(this._uniLinkHelper);

  final UniLinkHelper _uniLinkHelper;
  Uri? deeplinkUri;

  Future<void> handleDeepLinkRoutes(final Uri? uri) async {
    Future<dynamic>.delayed(const Duration(milliseconds: 100))
        .then((final dynamic value) {
      final path = uri?.path;
      if (path?.isNotEmpty == true) {
        _handleRoute(Utils.nullSafety(path));
      }
    });
  }

  Future<void> handleInitialUri() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // 1. Deeplink in app (uni_links)
      final initialUri = await _uniLinkHelper.getInitialUriUniLink();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      deeplinkUri = initialUri;
      handleDeepLinkRoutes(initialUri);
    } on PlatformException {
      Log.info('error handle deeplink');
    }
  }

  StreamSubscription<Uri?>? handleIncomingLinks() {
    try {
      return _uniLinkHelper.uriUniLinkStream().listen(
        (final Uri? uri) async {
          deeplinkUri = uri;
          handleDeepLinkRoutes(uri);
        },
      );
    } catch (e) {
      return null;
    }
  }
}

@lazySingleton
class UniLinkHelper {
  Future<Uri?> getInitialUriUniLink() async {
    try {
      return await getInitialUri();
    } catch (_) {
      return null;
    }
  }

  Stream<Uri?> uriUniLinkStream() {
    return uriLinkStream;
  }
}
