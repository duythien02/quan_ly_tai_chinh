// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

Widget loadingView(final BuildContext context) {
  return Center(
    child: SizedBox(
      width: 80,
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
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
  );
}
