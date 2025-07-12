// Flutter imports:
import 'package:flutter/material.dart';

class WebViewParams {
  WebViewParams(
    this.context, {
    this.content,
    this.externalLinks = const [],
    this.isHybridComposition = true,
    this.openExternalLinkInBrowser = false,
  });

  final BuildContext context;
  final String? content;
  final List<String?> externalLinks;
  final bool isHybridComposition;
  final bool openExternalLinkInBrowser;
}
