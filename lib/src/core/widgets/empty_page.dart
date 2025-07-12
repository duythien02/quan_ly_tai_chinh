// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.appBar,
    this.title,
  });

  final PreferredSizeWidget? appBar;
  final String? title;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Text(
          title ?? context.l10n.emptyContent,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}

Widget emptyBody(final BuildContext context, {final String? title}) => ListView(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
          child: Center(
            child: Text(
              title ?? context.l10n.emptyContent,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
        ),
      ],
    );
