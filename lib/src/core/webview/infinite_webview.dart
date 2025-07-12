// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Project imports:
import '../app_strings.dart';
import '../enums/web_content_mode.dart';
import '../utils/launcher.dart';
import '../utils/utils.dart';

import 'helper/register_web_webview_stub.dart'
    if (dart.library.html) './helper/register_web_webview.dart';

// webview get content height, can not expand
class InfiniteWebView extends StatefulWidget {
  const InfiniteWebView._init({
    this.url,
    this.contentMode,
    this.content,
    required this.isHybridComposition,
    required this.tel,
    required this.loadingWidget,
    required this.onNavigated,
  });

  factory InfiniteWebView.fromUrl(
    final String url, {
    final bool isHybridComposition = true,
    required final String tel,
    required final Widget loadingWidget,
    required final void Function(String?) onNavigated,
  }) {
    return InfiniteWebView._init(
      contentMode: WebContentMode.url,
      url: url,
      isHybridComposition: isHybridComposition,
      tel: tel,
      loadingWidget: loadingWidget,
      onNavigated: onNavigated,
    );
  }

  factory InfiniteWebView.fromHtml(
    final String htmlContent, {
    final bool isHybridComposition = true,
    required final String tel,
    required final Widget loadingWidget,
    required final void Function(String?) onNavigated,
  }) {
    return InfiniteWebView._init(
      contentMode: WebContentMode.html,
      content: htmlContent,
      isHybridComposition: isHybridComposition,
      tel: tel,
      loadingWidget: loadingWidget,
      onNavigated: onNavigated,
    );
  }
  final String? url;

  final WebContentMode? contentMode;

  final String? content;

  final bool isHybridComposition;

  final String tel;

  final Widget loadingWidget;

  final void Function(String?) onNavigated;
  @override
  State<InfiniteWebView> createState() => _InfiniteWebViewState();
}

class _InfiniteWebViewState extends State<InfiniteWebView> {
  webview.WebViewController? _controller;

  bool isLoading = true;

  double heightWebview = 250;

  @override
  void initState() {
    if (kIsWeb) {
      registerWebViewWebImplementation();
    } else {
      if (Platform.isAndroid && widget.isHybridComposition) {
        WebViewPlatform.instance = AndroidWebViewPlatform();
      }
    }

    unawaited(initController());

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return (widget.contentMode == WebContentMode.html)
        ? buildHtmlPage()
        : buildWebView();
  }

  Widget buildHtmlPage() {
    return SingleChildScrollView(
      child: HtmlWidget(
        widget.content ?? '',
        onTapUrl: (final url) {
          if (url.contains(widget.tel)) {
            unawaited(Launcher.open(url: url));
          } else {
            widget.onNavigated(url);
          }

          return true;
        },
      ),
    );
  }

  SizedBox buildWebView() {
    return SizedBox(
      height: heightWebview,
      child: Stack(
        children: <Widget>[
          if (_controller != null) WebViewWidget(controller: _controller!),
          if (isLoading) widget.loadingWidget else const Center(),
        ],
      ),
    );
  }

  Future<void> initController() async {
    _controller = WebViewController();
    await _controller?.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _controller?.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (final url) async {
          // if (_controller != null) {
          //   _title = await _controller
          //       .evaluateJavascript('window.document.title');
          //   setState(() {});
          // }
          final tempHeight = await _controller?.runJavaScriptReturningResult(
            AppStrings.getScrollHeightWebView,
          ) as num?;
          heightWebview = (tempHeight ?? 0).toDouble();
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        },
        onNavigationRequest: (final request) async {
          if (request.url.contains(widget.tel)) {
            await Launcher.open(url: request.url);

            return NavigationDecision.prevent;
          } else if (request.url == widget.url ||
              request.url == widget.content) {
            return NavigationDecision.navigate;
          } else {
            if (Utils.isIOS && isLoading) {
              return NavigationDecision.prevent;
            }
            widget.onNavigated(request.url);

            return NavigationDecision.prevent;
          }
        },
      ),
    );
    if (widget.contentMode == WebContentMode.html) {
      await _controller?.loadHtmlString(Utils.nullSafety(widget.content));
    } else {
      await _controller?.loadRequest(Uri.parse(Utils.nullSafety(widget.url)));
    }
  }
}
