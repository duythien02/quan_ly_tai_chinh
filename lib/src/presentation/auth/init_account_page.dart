import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/params/params.dart';
import '../../injector/injector.dart';
import '../account/bloc/account_bloc.dart';
import 'widgets/init_account_body.dart';

class InitAccountPage extends StatelessWidget {
  const InitAccountPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (final context) => getIt<AccountBloc>()
          ..add(
            GetCurrencies(
              GetCurrenciesRequestParams(),
            ),
          ),
        child: const InitAccountBody(),
      ),
    );
  }
}
