import 'package:flutter/material.dart';

import 'widgets/auth_body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEFEFEF),
        child: const AuthBody(),
      ),
    );
  }
}
