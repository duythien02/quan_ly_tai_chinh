import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'image_size.dart';

class ImageParams {
  ImageParams({
    required this.name,
    this.size,
    this.color,
    this.fit = BoxFit.cover,
  });

  final String name;
  final ImageSize? size;
  final Color? color;
  final BoxFit fit;
}

class AnimationParams {
  AnimationParams({
    required this.name,
    this.onLoaded,
    this.repeat = true,
    this.controller,
    this.size,
  });

  final String name;
  final Animation<double>? controller;
  final bool repeat;
  final ImageSize? size;
  final void Function(LottieComposition)? onLoaded;
}
