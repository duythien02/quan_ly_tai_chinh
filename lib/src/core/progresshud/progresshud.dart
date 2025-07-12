// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'loading_view.dart';

// Package imports:

class ProgressHud extends StatelessWidget {
  const ProgressHud({
    final Key? key,
    required this.isShowLoading,
    this.opacity = 0,
    this.color,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  final bool isShowLoading;
  final double opacity;
  final Color? color;
  final bool dismissible;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (isShowLoading) ...[
          loadingView(context),
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 100),
            child: ModalBarrier(
              dismissible: dismissible,
              color: color ?? Theme.of(context).hintColor,
            ),
          ),
        ],
      ],
    );
  }
}
