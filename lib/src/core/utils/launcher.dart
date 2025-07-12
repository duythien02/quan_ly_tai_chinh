// Package imports:
import 'package:url_launcher/url_launcher_string.dart';

class Launcher {
  Launcher._();
  static Future<void> open({
    required final String url,
    final Function()? onError,
  }) async {
    await canLaunchUrlString(url).then((final bool result) {
      if (result) {
        launchUrlString(url);
      } else {
        if (onError != null) {
          onError();
        } else {
          throw ArgumentError('Could not launch $url');
        }
      }
    });
  }

  static Future<void> openWeb({required final String url}) async {
    await canLaunchUrlString(url).then((final bool result) {
      if (result) {
        launchUrlString(url, mode: LaunchMode.externalApplication);
      } else {
        launchUrlString(url);
      }
    });
  }

  static Future<void> callPhone(final String value) async {
    String url = '';
    url = value.contains('tel:') ? value : 'tel:$value';
    canLaunchUrlString(url).then((final bool result) {
      if (result) {
        launchUrlString(url);
      } else {
        throw ArgumentError('Could not launch $url');
      }
    });
  }
}
