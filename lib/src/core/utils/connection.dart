// Dart imports:
import 'dart:io';

// Project imports:
import '../logger/logger.dart';

class Connection {
  static Future<bool> status() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Log.info('nd utils check connection status');

        return true;
      }
    } on SocketException catch (e) {
      Log.info('nd utils check connection status $e');

      return false;
    }

    return false;
  }
}
