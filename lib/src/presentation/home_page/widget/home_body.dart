import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_intl/ez_intl.dart';
import '../../../core/bloc/ez_bloc.dart';
import '../../../domain/entities/entities.dart';
import '../../_blocs/authentication/token_authentication_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Auth? auth;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (final context, final state) {},
          builder: (final context, final state) {
            return Column(
              children: [
                Text(
                  context.l10n.hello,
                ),
                const SizedBox(height: 24),
                IconButton(
                  onPressed: () {
                    context
                        .read<TokenAuthenticationBloc>()
                        .add(TokenAuthenticationLoggedOut());
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
