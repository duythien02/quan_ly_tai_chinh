// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'loading_view.dart';

// Package imports:

class OpacityLoadingView extends StatelessWidget {
  const OpacityLoadingView({
    final Key? key,
    this.opacity = 0.2,
    this.backgroundColor,
    this.dismissible = false,
  }) : super(key: key);

  final double opacity;

  final Color? backgroundColor;

  final bool dismissible;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        loadingView(context),
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 100),
          child: ModalBarrier(
            dismissible: dismissible,
            color: backgroundColor ?? Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}
