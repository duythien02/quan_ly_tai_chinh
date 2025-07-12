// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Project imports:
import '../app_strings.dart';
import '../enums/web_content_mode.dart';
import '../progresshud/nd_progresshud.dart';
import '../utils/launcher.dart';
import '../utils/utils.dart';

import 'helper/register_web_webview_stub.dart'
    if (dart.library.html) './helper/register_web_webview.dart';

// webview get content height, can collapse or expandable
class ExpansionWebView extends StatefulWidget {
  const ExpansionWebView._init({
    this.url,
    this.contentMode,
    this.content,
    required this.isDetail,
    this.minHeight = 250,
    this.boxDecoration,
    this.margin,
    required this.isHybridComposition,
    this.seeMoreText,
    this.seeMoreStyle,
    this.collapseText,
    this.collapseStyle,
    required this.loadingWidget,
    required this.onNavigated,
    this.onExpand,
  });

  factory ExpansionWebView.fromUrl(
    final String? url, {
    final double minHeight = 250,
    final BoxDecoration? boxDecoration,
    final EdgeInsets? margin,
    required final bool isDetail,
    final bool isHybridComposition = true,
    required final String seeMoreText,
    final TextStyle? seeMoreStyle,
    required final String collapseText,
    final TextStyle? collapseStyle,
    final Widget? loadingWidget,
    required final NavigationDecision Function(String?) onNavigated,
    final void Function(WebViewController?, {bool isExpand})? onExpand,
  }) {
    return ExpansionWebView._init(
      contentMode: WebContentMode.url,
      url: url,
      minHeight: minHeight,
      boxDecoration: boxDecoration,
      margin: margin,
      isDetail: isDetail,
      isHybridComposition: isHybridComposition,
      collapseStyle: collapseStyle,
      collapseText: collapseText,
      seeMoreStyle: seeMoreStyle,
      seeMoreText: seeMoreText,
      loadingWidget: loadingWidget,
      onNavigated: onNavigated,
      onExpand: onExpand,
    );
  }

  factory ExpansionWebView.fromHtml(
    final String htmlContent, {
    final double minHeight = 250,
    final BoxDecoration? boxDecoration,
    final EdgeInsets? margin,
    required final bool isDetail,
    final bool isHybridComposition = true,
    final String? seeMoreText,
    final TextStyle? seeMoreStyle,
    final String? collapseText,
    final TextStyle? collapseStyle,
    final Widget? loadingWidget,
    required final NavigationDecision Function(String?) onNavigated,
    final void Function(WebViewController?, {bool isExpand})? onExpand,
  }) {
    return ExpansionWebView._init(
      contentMode: WebContentMode.html,
      content: htmlContent,
      minHeight: minHeight,
      boxDecoration: boxDecoration,
      margin: margin,
      isDetail: isDetail,
      isHybridComposition: isHybridComposition,
      collapseStyle: collapseStyle,
      collapseText: collapseText,
      seeMoreStyle: seeMoreStyle,
      seeMoreText: seeMoreText,
      loadingWidget: loadingWidget,
      onNavigated: onNavigated,
      onExpand: onExpand,
    );
  }
  final bool isDetail;

  final String? url;

  final WebContentMode? contentMode;

  final String? content;

  final double minHeight;

  final BoxDecoration? boxDecoration;

  final EdgeInsets? margin;

  final bool isHybridComposition;

  final String? seeMoreText;

  final TextStyle? seeMoreStyle;

  final String? collapseText;

  final TextStyle? collapseStyle;

  final Widget? loadingWidget;

  final NavigationDecision Function(String?) onNavigated;

  final void Function(WebViewController? controller, {bool isExpand})? onExpand;

  @override
  State<ExpansionWebView> createState() => _ExpansionWebViewState();
}

class _ExpansionWebViewState extends State<ExpansionWebView> {
  final webviewHtmlKey = GlobalKey();

  bool isCollapsedHtml = true;

  WebViewController? _controller;

  double heightWebview = 250;

  double? minHeight;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Utils.isCommonPlatforms) {
      if (kIsWeb) {
        registerWebViewWebImplementation();
      } else {
        if (Platform.isAndroid && widget.isHybridComposition) {
          WebViewPlatform.instance = AndroidWebViewPlatform();
        }
      }

      unawaited(initController());
    }

    isCollapsedHtml = !widget.isDetail;
    minHeight = widget.minHeight < 100 ? 100 : widget.minHeight;
    heightWebview = minHeight ?? 250;
  }

  @override
  Widget build(final BuildContext context) {
    return (widget.contentMode == WebContentMode.html)
        ? buildHtml(context)
        : buildWebView(context);
  }

  Widget buildHtml(final BuildContext context) {
    return Container(
      margin: widget.margin,
      height: isCollapsedHtml ? minHeight : null,
      decoration: widget.boxDecoration,
      child: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: HtmlWidget(
                    key: webviewHtmlKey,
                    widget.content ?? '',
                    onTapUrl: (final url) {
                      if (url.contains(AppStrings.tel)) {
                        unawaited(Launcher.open(url: url));
                      } else {
                        widget.onNavigated(url);
                      }

                      return true;
                    },
                  ),
                ),
              ],
            ),
            ...buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Container buildWebView(final BuildContext context) {
    return Container(
      margin: widget.margin,
      height: isCollapsedHtml || heightWebview < minHeight!
          ? minHeight
          : heightWebview,
      decoration: widget.boxDecoration,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          buildWebContent(),
          ...buildBottomButtons(),
        ],
      ),
    );
  }

  Widget buildWebContent() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
      child: Stack(
        children: <Widget>[
          if (isLoading)
            widget.loadingWidget ?? const LoadingWidget()
          else
            WebViewWidget(controller: _controller!),
        ],
      ),
    );
  }

  List<Widget> buildBottomButtons() {
    return [
      if (!isCollapsedHtml) buildCollapsedButton(context),
      buildExpandedButton(context),
    ];
  }

  SizedBox buildExpandedButton(final BuildContext context) {
    return SizedBox(
      height: minHeight,
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          if (isCollapsedHtml) ...<Widget>[
            GestureDetector(
              onTap: () {
                isCollapsedHtml = !isCollapsedHtml;
                widget.onExpand?.call(_controller, isExpand: !isCollapsedHtml);
                if (mounted) {
                  setState(() {});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.seeMoreText ?? context.l10n.viewMore,
                      style: widget.seeMoreStyle ??
                          Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.link),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.link,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildCollapsedButton(final BuildContext context) {
    return SizedBox(
      height: heightWebview,
      child: Column(
        children: [
          const Spacer(),
          if (!isCollapsedHtml)
            GestureDetector(
              onTap: () {
                isCollapsedHtml = !isCollapsedHtml;
                widget.onExpand?.call(_controller, isExpand: !isCollapsedHtml);
                setState(() {});
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.collapseText ?? context.l10n.collapse,
                      style: widget.collapseStyle ??
                          Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.link),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_up_sharp,
                      color: AppColors.link,
                      size: 24,
                    ),
                  ],
                ),
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future<void> initController() async {
    _controller = WebViewController();
    await _controller?.enableZoom(false);
    await _controller?.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _controller?.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (final url) async {
          if (widget.contentMode == WebContentMode.html) {
            updateHtmlHeight();
          } else {
            final clientHeight =
                await getJSHeight(AppStrings.getClientHeightWebView);
            final scrollHeight =
                await getJSHeight(AppStrings.getScrollHeightWebView);
            heightWebview = (clientHeight != 0 ? clientHeight : scrollHeight);
          }
          if (mounted) {
            isLoading = false;
            setState(() {});
          }
        },
        onNavigationRequest: (final request) async {
          if (request.url.contains(AppStrings.tel)) {
            await Launcher.open(url: request.url);

            return NavigationDecision.prevent;
          } else if (request.url == widget.url ||
              request.url == widget.content) {
            return NavigationDecision.navigate;
          } else {
            if (isLoading) {
              return NavigationDecision.prevent;
            }

            return widget.onNavigated(request.url);
          }
        },
      ),
    );
    if (widget.contentMode == WebContentMode.html) {
      await _controller?.loadHtmlString(Utils.nullSafety(widget.content));
      updateHtmlHeight();
    } else {
      await _controller?.loadRequest(Uri.parse(Utils.nullSafety(widget.url)));
    }
  }

  void updateHtmlHeight() {
    final htmlHeight =
        webviewHtmlKey.currentContext?.size?.height ?? minHeight ?? 0;
    heightWebview = htmlHeight + 60;
  }

  Future<double> getJSHeight(final String js) async {
    return (await _controller?.runJavaScriptReturningResult(js) as num?)
            ?.toDouble() ??
        0;
  }
}
