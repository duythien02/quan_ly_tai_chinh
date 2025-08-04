import 'package:flutter/material.dart';

import '../../core/bloc/ez_bloc.dart';
import '../../core/params/params.dart';
import '../../injector/injector.dart';
import '../profile/bloc/profile_bloc.dart';
import 'bloc/home_bloc.dart';
import 'widget/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (final context) => getIt<ProfileBloc>()
              ..add(
                GetUserProfileEvent(
                  GetUserProfileRequestParams(),
                ),
              ),
          ),
          BlocProvider(
            create: (final context) => getIt<HomeBloc>(),
          ),
        ],
        child: const HomeBody(),
      ),
    );
  }
}
