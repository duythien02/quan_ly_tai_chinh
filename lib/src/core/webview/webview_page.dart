// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Project imports:
import '../app_strings.dart';
import '../enums/web_content_mode.dart';
import '../utils/launcher.dart';
import '../utils/string_helper.dart';
import '../utils/utils.dart';
import 'app_bar.dart';
import 'webview_bundle.dart';
import 'webview_helper.dart';

import 'helper/register_web_webview_stub.dart'
    if (dart.library.html) './helper/register_web_webview.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage(this.webviewBundle, {final Key? key}) : super(key: key);

  final WebviewBundle webviewBundle;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebContentMode contentMode;

  late String? content;

  late String? url;

  String? _title;

  late WebViewController _controller;

  bool canBack = false;

  @override
  void initState() {
    super.initState();
    if (widget.webviewBundle.content.isURL()) {
      contentMode = WebContentMode.url;
      url = widget.webviewBundle.content;
    } else {
      contentMode = WebContentMode.html;
      content = WebViewHelper.convertHtmlToUri(widget.webviewBundle.content);
    }

    if (kIsWeb) {
      registerWebViewWebImplementation();
    } else {
      if (Platform.isAndroid && widget.webviewBundle.isHybridComposition) {
        WebViewPlatform.instance = AndroidWebViewPlatform();
      }
    }

    unawaited(initController());

    widget.webviewBundle.checkConnectionFunction();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: (contentMode == WebContentMode.url)
          ? buildAppBarWebView(
              context,
              title: _title ?? widget.webviewBundle.appName,
              onBack: _controller.goBack,
              canBack: canBack,
            )
          : null,
      body: WebViewWidget(controller: _controller),
    );
  }

  Future<void> initController() async {
    _controller = WebViewController();
    if (!kIsWeb) {
      await _controller.enableZoom(true);
      await _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      await _controller.setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (final url) async {
            canBack = await _controller.canGoBack();
            _title = await _controller.runJavaScriptReturningResult(
              AppStrings.getTitleWebView,
            ) as String;
            _title = _title?.replaceAll('"', '');
          },
          onNavigationRequest: (final request) async {
            if (widget.webviewBundle.openExternalLinkInBrowser) {
              final externalLinks = widget.webviewBundle.externalLinks;
              final shouldOpenExternalLink = externalLinks.firstWhereOrNull(
                (final element) {
                  if (element != null) {
                    return request.url.contains(element);
                  }

                  return false;
                },
              );
              if (shouldOpenExternalLink != null) {
                await Launcher.openWeb(url: request.url);

                return NavigationDecision.prevent;
              }
            }
            if (request.url.contains(widget.webviewBundle.tel)) {
              await Launcher.open(url: request.url);

              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      );
    }

    if (contentMode == WebContentMode.html) {
      await _controller.loadHtmlString(Utils.nullSafety(content));
    } else {
      await _controller.loadRequest(Uri.parse(Utils.nullSafety(url)));
    }

    await _handleSelectFile();
  }

  Future<void> _handleSelectFile() async {
    if (_controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (_controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);

      (_controller.platform as AndroidWebViewController)
          .setOnShowFileSelector((final params) async {
        final result = await FilePicker.platform.pickFiles();

        if (result != null) {
          final File file = File(result.paths.firstOrNull ?? '');

          return [file.uri.toString()];
        } else {
          return [];
        }
      });
    }
  }
}
