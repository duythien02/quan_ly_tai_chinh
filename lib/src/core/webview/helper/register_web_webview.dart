// Package imports:
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void registerWebViewWebImplementation() {
  WebViewPlatform.instance = WebWebViewPlatform();
}
