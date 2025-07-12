// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({final Key? key, this.visible = true}) : super(key: key);

  final bool visible;

  @override
  Widget build(final BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
