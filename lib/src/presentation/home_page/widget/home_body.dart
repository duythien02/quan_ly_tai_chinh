import 'package:flutter/material.dart';

import '../../../core/bloc/ez_bloc.dart';
import '../../_blocs/authentication/token_authentication_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (final context, final state) {
          return;
        },
        child: IconButton(
          onPressed: () {
            context
                .read<TokenAuthenticationBloc>()
                .add(TokenAuthenticationLoggedOut());
          },
          icon: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
