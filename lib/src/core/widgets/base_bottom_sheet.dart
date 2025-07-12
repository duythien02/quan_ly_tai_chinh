// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    final Key? key,
    required this.title,
    required this.child,
    this.height,
  }) : super(key: key);

  final String title;

  final Widget child;

  final double? height;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 372 / 812,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark.withValues(alpha: 0),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          headerBottomSheet(context, title),
          Container(
            height: 4,
            width: double.infinity,
            color: Theme.of(context).dividerColor,
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

Widget headerBottomSheet(final BuildContext context, final String title) {
  return Container(
    height: 60,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: Theme.of(context).dividerColor),
          iconSize: 32,
          onPressed: Navigator.of(context).pop,
        ),
      ],
    ),
  );
}

Future<void> showBaseBottomSheet({
  required final BuildContext context,
  required final String title,
  required final Widget child,
  final double? height,
}) {
  return showModalBottomSheet<void>(
    backgroundColor: Theme.of(context).primaryColorDark.withValues(alpha: 0),
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    builder: (final context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BaseBottomSheet(
          title: title,
          height: height,
          child: child,
        ),
      );
    },
  );
}
