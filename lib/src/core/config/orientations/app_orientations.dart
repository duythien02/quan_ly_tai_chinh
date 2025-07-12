// Flutter imports:
import 'package:flutter/services.dart';

class AppOrientations {
  /// support portrait for mobile
  /// support two mode portrait and landscape for tablet
  static List<DeviceOrientation> orientations() {
    // final orientation = isTabletWithoutContext()
    //     ? [DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight]
    //     : [DeviceOrientation.portraitUp];
    final orientation = [DeviceOrientation.portraitUp];

    return orientation;
  }

  // static bool isTabletWithoutContext() {
  //   final SingletonFlutterWindow window = WidgetsBinding.instance.window;

  //   final MediaQueryData data = MediaQueryData.fromWindow(window);

  //   return data.size.shortestSide >= 600;
  // }
}
