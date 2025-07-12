// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ez_intl/ez_intl.dart';

class BaseErrorWidget extends StatelessWidget {
  const BaseErrorWidget({
    final Key? key,
    required this.detailsException,
  }) : super(key: key);

  final dynamic detailsException;

  Widget _errorWidget(final BuildContext context) {
    return Center(
      child: AutoSizeText(
        context.l10n.unknown,
        maxFontSize: 16,
        minFontSize: 10,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _errorWidget(context),
      ),
    );
  }
}
