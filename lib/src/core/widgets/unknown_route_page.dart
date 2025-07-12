// Flutter imports:
import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({
    final Key? key,
    this.route,
  }) : super(key: key);

  final String? route;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text(route ?? '')),
      body: Center(
        child: Text('Chưa có đường dẫn ${route ?? ''}'),
      ),
    );
  }
}
