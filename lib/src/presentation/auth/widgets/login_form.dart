import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/params.dart';
import '../../../core/utils/custom_text_fields.dart';
import '../../_blocs/authentication/token_authentication_bloc.dart';
import '../bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onRegisterTapped});

  final VoidCallback onRegisterTapped;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (final context, final state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is AuthLoginSuccess) {
            context.read<TokenAuthenticationBloc>().add(
                  TokenAuthenticationLoggedIn(),
                );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _usernameController,
                hintText: 'Username',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (final context, final state) {
                  return ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            context.read<AuthBloc>().add(
                                  AuthLoginRequested(
                                    LoginRequestParams(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  ),
                                );
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: widget.onRegisterTapped,
                child: const Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
