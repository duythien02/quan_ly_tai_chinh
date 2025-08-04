// Flutter imports:
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'ez_resources_params.dart';

export 'app_icons.dart';
export 'app_images.dart';

class EZResources {
  static String package = 'ez_resources';

  static Widget image(final ImageParams params) {
    final imageType = p.extension(params.name);
    if (imageType == '.svg') {
      //Handle svg image from network
      if (params.name.contains('http')) {
        return SvgPicture.network(
          params.name,
          width: params.size?.width,
          height: params.size?.height,
          fit: params.fit,
        );
      }
      return SvgPicture.asset(
        params.name,
        width: params.size?.width,
        height: params.size?.height,
        colorFilter: params.color != null
            ? ColorFilter.mode(params.color!, BlendMode.srcIn)
            : null,
        fit: params.fit,
        package: package,
      );
    }

    return Image.asset(
      params.name,
      width: params.size?.width,
      height: params.size?.height,
      color: params.color,
      fit: params.fit,
      package: package,
    );
  }

  static Widget animation(final AnimationParams params) {
    return Lottie.asset(
      params.name,
      controller: params.controller,
      repeat: params.repeat,
      width: params.size?.width,
      height: params.size?.height,
      onLoaded: params.onLoaded,
      package: package,
    );
  }

  static AssetImage assetImage(
    final String assetName, {
    final AssetBundle? bundle,
  }) {
    return AssetImage(assetName, bundle: bundle, package: package);
  }
}
