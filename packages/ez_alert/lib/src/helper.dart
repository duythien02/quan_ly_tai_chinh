import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:url_launcher/url_launcher_string.dart';

class Helper {
  static void redirectToStore(
      {required String appStoreUrl, required String playStoreUrl}) {
    try {
      if (Platform.isIOS) {
        unawaited(launchUrlString(appStoreUrl));
      } else if (Platform.isAndroid) {
        unawaited(launchUrlString(playStoreUrl));
      }
    } catch (e) {
      log(
        'redirectToStore error: ${e.toString()}',
      );
    }
  }
}
