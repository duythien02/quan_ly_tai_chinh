// Flutter imports:
import 'package:flutter/widgets.dart';

class SizeUtils {
  static double defaultHeight = 896.0;
  static double defaultWidth = 414.0;

  static double screenHeight(final BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(final BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(final BuildContext context, final double height) =>
      screenHeight(context) * height / defaultHeight;

  static double getWidth(final BuildContext context, final double width) =>
      screenWidth(context) * width / defaultWidth;
}
