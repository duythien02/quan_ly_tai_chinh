// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/enums/tabbar_items.dart';
import '../../../injector/injector.dart';
import '../tabbar.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => getIt<TabbarBloc>()..add(TabbarStarted()),
      child: const TabBarView(),
    );
  }
}

class TabBarView extends StatefulWidget {
  const TabBarView({final Key? key}) : super(key: key);

  @override
  State<TabBarView> createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarView> {
  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<TabbarBloc, TabbarState>(
      listener: (final context, final state) {},
      builder: (final context, final state) {
        if (state is TabBarChangeSuccess) {
          return Scaffold(
            body: buildPage(context, state.index),
            bottomNavigationBar: AppCupertinoTabbar(
              index: state.index,
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildPage(final BuildContext context, final int index) {
    final pages = getTabBarWidgetsMap().values.toList();

    return pages[index];
  }
}
