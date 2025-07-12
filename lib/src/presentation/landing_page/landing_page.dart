// Flutter imports:
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Hello mobile team',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
