// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// Project imports:

ImageProvider getCacheNetworkImageProvider(final String url) {
  return CachedNetworkImageProvider(url);
}

class EzCachedNetworkImage extends StatefulWidget {
  const EzCachedNetworkImage({
    final Key? key,
    this.width,
    this.height,
    this.errorTextColor,
    this.fit = BoxFit.cover,
    required this.imageUrl,
    this.filterQuality = FilterQuality.medium,
    this.useOldImageOnUrlChange = true,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.memCacheHeight,
    this.memCacheWidth,
    this.diskCacheHeight,
    this.diskCacheWidth,
  }) : super(key: key);

  final double? width;
  final double? height;
  final BoxFit fit;
  final String? imageUrl;
  final FilterQuality filterQuality;
  final bool useOldImageOnUrlChange;
  final Duration fadeInDuration;
  final Color? errorTextColor;
  final int? memCacheHeight;
  final int? memCacheWidth;
  final int? diskCacheHeight;
  final int? diskCacheWidth;

  @override
  State<EzCachedNetworkImage> createState() => _EzCachedNetworkImageState();

  static void validateImage({
    required final String? imageUrl,
    required final Function(FileInfo) onValidImage,
    required final Function() onDone,
  }) {
    // get image from url (if already cached, default cache manager will return
    // the cached image )
    final fileRes = DefaultCacheManager().getFileStream(
      imageUrl ?? '',
      key: imageUrl,
    );

    // if return null or a valid image and then stop loading state
    // during listen, event is DownloadProgress object
    // if image is valid, then after loading, the event will be a FileInfo
    fileRes.listen(
      (final event) {
        if (event is FileInfo) {
          onValidImage.call(event);
        }
      },
      onDone: () => onDone(),
      onError: (final Object _) => onDone(),
    );
  }
}

class _EzCachedNetworkImageState extends State<EzCachedNetworkImage> {
  var _isLoading = true;
  FileInfo? file;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: AnimatedCrossFade(
        firstChild: const SizedBox.shrink(),
        secondChild: buildBody(context),
        crossFadeState:
            _isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 350),
      ),
    );
  }

  Widget buildBody(final BuildContext context) {
    EzCachedNetworkImage.validateImage(
      imageUrl: widget.imageUrl,
      onValidImage: (final successImage) {
        file = successImage;
      },
      onDone: _stopLoadingState,
    );

    if (file != null) {
      return buildImage();
    }

    return errorImageWidget();
  }

  Widget buildImage() {
    return CachedNetworkImage(
      width: widget.width,
      height: widget.height,
      memCacheHeight: widget.memCacheHeight,
      memCacheWidth: widget.memCacheWidth,
      maxWidthDiskCache: widget.diskCacheWidth,
      maxHeightDiskCache: widget.diskCacheHeight,
      fit: widget.fit,
      imageUrl: widget.imageUrl ?? '',
      filterQuality: widget.filterQuality,
      fadeInDuration: widget.fadeInDuration,
      useOldImageOnUrlChange: widget.useOldImageOnUrlChange,
      placeholder: (final BuildContext context, final String url) => SizedBox(
        height: widget.height,
        width: widget.width,
      ),
      errorWidget:
          (final BuildContext context, final String url, final dynamic error) =>
              Container(
        color: Colors.black.withValues(alpha: 0.1),
        height: widget.height,
        child: Center(
          child: Icon(
            Icons.error_outline,
            color: widget.errorTextColor ?? Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }

  Widget errorImageWidget() => Container(
        color: Colors.black.withValues(alpha: 0.1),
        height: widget.height,
        child: Center(
          child: Icon(
            Icons.error_outline,
            color: widget.errorTextColor ?? Theme.of(context).hintColor,
          ),
        ),
      );

  void _stopLoadingState() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

CachedNetworkImageProvider baseCachedNetworkImageProvider(
  final BaseCachedNetworkImageProviderParams params,
) {
  return CachedNetworkImageProvider(
    params.url,
    maxHeight: params.maxHeight,
    maxWidth: params.maxWidth,
    scale: params.scale,
    headers: params.headers,
    cacheKey: params.cacheKey,
  );
}

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({
    final Key? key,
    this.height,
    this.errorTextColor,
  }) : super(key: key);

  final double? height;
  final Color? errorTextColor;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Icon(
          Icons.error_outline,
          color: errorTextColor,
          size: height,
        ),
      ),
    );
  }
}

class BaseCachedNetworkImageProviderParams {
  BaseCachedNetworkImageProviderParams({
    required this.url,
    this.maxHeight,
    this.maxWidth,
    this.errorListener,
    this.headers,
    this.cacheKey,
  });

  final String url;
  final int? maxHeight;
  final int? maxWidth;
  final double scale = 1.0;
  final void Function()? errorListener;
  final Map<String, String>? headers;
  final String? cacheKey;
}

class CuppertinoDatePickerParams {
  CuppertinoDatePickerParams({
    required this.context,
    required this.onPressed,
    required this.initialItem,
    required this.onSelectedItemChanged,
    required this.doneText,
    required this.children,
    this.doneTextStyle,
  });

  final BuildContext context;
  final void Function() onPressed;
  final int initialItem;
  final ValueChanged<int> onSelectedItemChanged;
  final String doneText;
  final List<Widget> children;
  final TextStyle? doneTextStyle;
}

class SingletonAlertDialogParams {
  SingletonAlertDialogParams(
    this.context,
    this.msg, {
    required this.acceptButtonTitle,
    this.acceptButton,
    this.title = '',
    this.onPressOK,
    this.isPop = true,
  });

  final BuildContext context;
  final String? msg;
  final String acceptButtonTitle;
  final String? acceptButton;
  final String title;
  final Function()? onPressOK;
  final bool isPop;
}
