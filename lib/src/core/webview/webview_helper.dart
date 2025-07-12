// Dart imports:
import 'dart:convert';

class WebViewHelper {
  static String headerHtml =
      '\n  <!DOCTYPE html>\n  <html>\n  <head>\n    <meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width,initial-scale=1">\n    <meta name="description" content="meta description">    <meta name = "format-detection" content = "telephone=no">\n  </head>\n'
      '<body>';
  static String footerHtml = '</body>\n</html>';

  static String convertHtmlToUri(final String htmlContent) =>
      Uri.dataFromString(
        (htmlContent.contains('<!DOCTYPE html>'))
            ? htmlContent
            : WebViewHelper.headerHtml + htmlContent + WebViewHelper.footerHtml,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString();
}
