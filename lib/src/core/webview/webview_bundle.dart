// Flutter imports:
import 'package:flutter/material.dart';

class WebviewBundle {
  WebviewBundle({
    required this.content,
    required this.appName,
    required this.checkConnectionFunction,
    required this.externalLinks,
    required this.loadingWidget,
    required this.tel,
    required this.titleAppbarStyle,
    this.isHybridComposition = true,
    this.openExternalLinkInBrowser = false,
  });
  final String content;
  final String appName;
  final Function() checkConnectionFunction;
  final List<String?> externalLinks;
  final Widget loadingWidget;
  final String tel;
  final TextStyle titleAppbarStyle;
  final bool isHybridComposition;
  final bool openExternalLinkInBrowser;
}
