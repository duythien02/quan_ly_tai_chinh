// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../presentation/_blocs/authentication/token_authentication_bloc.dart';
import '../bloc/ez_bloc.dart';

class AppMediaQuery extends StatelessWidget {
  const AppMediaQuery({
    final Key? key,
    required this.child,
    required this.text,
    this.showBanner = false,
  }) : super(key: key);
  final Widget child;
  final bool showBanner;
  final String text;
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TokenAuthenticationBloc, TokenAuthenticationState>(
      builder: (final context, final state) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[child, _buildBanner(context)],
          ),
        );
      },
    );
  }

  Widget _buildBanner(final BuildContext context) {
    if (showBanner) {
      return Banner(
        message: text,
        color: Theme.of(context).colorScheme.error,
        location: BannerLocation.topEnd,
      );
    }

    return const SizedBox.shrink();
  }
}
