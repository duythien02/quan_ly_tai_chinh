// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';

// Project imports:
import '../../domain/entities/webview_params.dart';
import '../app_strings.dart';
import '../webview/webview.dart';
import 'alert.dart';
import 'connection.dart';
import 'utils.dart';

class WebviewBundleHelper {
  static WebviewBundle _createWebviewBundle(final WebViewParams webViewParams) {
    return WebviewBundle(
      content: Utils.nullSafety(webViewParams.content),
      appName: webViewParams.context.l10n.appName,
      checkConnectionFunction: () async {
        Connection.status().then((final result) {
          if (!webViewParams.context.mounted) {
            return;
          }
          if (!result) {
            Alert.networkError(
              webViewParams.context,
              connectionError: webViewParams.context.l10n.connectionError,
              acceptButton: webViewParams.context.l10n.accept,
            );
            Navigator.of(webViewParams.context).pop();
          }
        });
      },
      loadingWidget: const CircularProgressIndicator(),
      tel: AppStrings.tel,
      titleAppbarStyle: TextStyle(
        color: Utils.textColorByAppBarTheme(webViewParams.context),
        fontWeight: FontWeight.w700,
        fontSize: 17,
        letterSpacing: -0.5,
      ),
      externalLinks: webViewParams.externalLinks,
      isHybridComposition: webViewParams.isHybridComposition,
      openExternalLinkInBrowser: webViewParams.openExternalLinkInBrowser,
    );
  }

  static WebviewBundle createBundleForWebViewPage(
    final BuildContext context, {
    final String? content,
    final bool isHybridComposition = true,
    final bool openExternalLinkInBrowser = false,
  }) {
    return _createWebviewBundle(
      WebViewParams(
        context,
        content: content,
        isHybridComposition: isHybridComposition,
        openExternalLinkInBrowser: openExternalLinkInBrowser,
      ),
    );
  }

  static WebviewBundle createBundleForWebviewSupportExternalLink(
    final WebViewParams webViewParams,
  ) {
    return _createWebviewBundle(
      WebViewParams(
        webViewParams.context,
        content: webViewParams.content,
        externalLinks: webViewParams.externalLinks,
        isHybridComposition: webViewParams.isHybridComposition,
        openExternalLinkInBrowser: webViewParams.openExternalLinkInBrowser,
      ),
    );
  }
}
