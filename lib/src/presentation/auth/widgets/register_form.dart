import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/params.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/custom_text_fields.dart';
import '../../../injector/injector.dart';
import '../bloc/bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.onLoginTapped});

  final VoidCallback onLoginTapped;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (final context, final state) async {
          if (state is AuthRegisterSuccess) {
            getIt<AppRouter>().replaceAll([const InitAccountRoute()]);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
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
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
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
                                  AuthRegisterRequested(
                                    RegisterRequestParams(
                                      username: _usernameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  ),
                                );
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text('Register'),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: widget.onLoginTapped,
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
