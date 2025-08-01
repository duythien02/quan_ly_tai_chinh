import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector/injector.dart';
import 'bloc/bloc.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showLoginPage = true;

  void _toggleView() {
    setState(() {
      _showLoginPage = !_showLoginPage;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (final context) => getIt<AuthBloc>(),
        child: _showLoginPage
            ? LoginForm(onRegisterTapped: _toggleView)
            : RegisterForm(onLoginTapped: _toggleView),
      ),
    );
  }
}
