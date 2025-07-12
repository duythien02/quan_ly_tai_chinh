import 'package:flutter/material.dart';

/// Namespace for Default App Padding
class AppPadding {
  /// App padding
  AppPadding();

  /// default value
  static const double defaultValue = 12;

  /// default value
  static const double regularValue = 15;

  /// small value
  static const double smallValue = 8;

  /// tiny value
  static const double tinyValue = 5;

  /// medium value
  static const double mediumValue = 20;

  /// large screen vertical padding
  static const double largeValue = 40;

  /// content padding
  static const double smallContentPadding = 24;

  /// small screen horizontal padding
  static const double mediumContentPadding = 30;

  /// large screen horizontal padding
  static const double largeContentPadding = 60;

  // -------- Horizontal Padding --------

  /// default horizontal padding
  static EdgeInsets defaultHorizontal() {
    return const EdgeInsets.symmetric(horizontal: defaultValue);
  }

  /// tiny horizontal padding
  static EdgeInsets tinyHorizontal() {
    return const EdgeInsets.symmetric(horizontal: tinyValue);
  }

  /// small horizontal padding
  static EdgeInsets smallHorizontal() {
    return const EdgeInsets.symmetric(horizontal: smallValue);
  }

  /// regular horizontal padding
  static EdgeInsets regularHorizontal() {
    return const EdgeInsets.symmetric(horizontal: regularValue);
  }

  /// medium horizontal padding
  static EdgeInsets mediumHorizontal() {
    return const EdgeInsets.symmetric(horizontal: mediumValue);
  }

  /// large horizontal padding
  static EdgeInsets largeHorizontal() {
    return const EdgeInsets.symmetric(horizontal: largeValue);
  }

  /// medium content horizontal padding
  static EdgeInsets mediumContentHorizontal() {
    return const EdgeInsets.symmetric(horizontal: mediumContentPadding);
  }

  // -------- Vertical Padding --------

  /// default vertical padding
  static EdgeInsets defaultVertical() {
    return const EdgeInsets.symmetric(vertical: defaultValue);
  }

  /// tiny vertical padding
  static EdgeInsets tinyVertical() {
    return const EdgeInsets.symmetric(vertical: tinyValue);
  }

  /// small vertical padding
  static EdgeInsets smallVertical() {
    return const EdgeInsets.symmetric(vertical: smallValue);
  }

  /// regular vertical padding
  static EdgeInsets regularVertical() {
    return const EdgeInsets.symmetric(vertical: regularValue);
  }

  /// medium vertical padding
  static EdgeInsets mediumVertical() {
    return const EdgeInsets.symmetric(vertical: mediumValue);
  }

  // -------- All Padding --------

  /// default all padding
  static EdgeInsets defaultAll() {
    return const EdgeInsets.all(defaultValue);
  }

  /// regular all padding
  static EdgeInsets regularAll() {
    return const EdgeInsets.all(regularValue);
  }

  /// medium all padding
  static EdgeInsets mediumAll() {
    return const EdgeInsets.all(mediumValue);
  }

  /// tiny all padding
  static EdgeInsets smallAll() {
    return const EdgeInsets.all(smallValue);
  }

  /// tiny all padding
  static EdgeInsets tinyAll() {
    return const EdgeInsets.all(tinyValue);
  }

  /// content horizontal padding
  static EdgeInsets smallContentAll() {
    return const EdgeInsets.all(smallContentPadding);
  }
}
