// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_resources/ez_resources.dart';

// Project imports:
import '../../core/utils/connection.dart';
import '../../core/utils/size_utils.dart';
import 'base_button.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({final Key? key}) : super(key: key);

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(final BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: EZResources.image(
                  ImageParams(
                    name: AppImages.imgBgNoConnection,
                    size: const ImageSize(200, 140),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                context.l10n.connectionErrorPleaseRefresh,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: SizeUtils.screenWidth(context) / 1.5,
                child: BaseButton(
                  content: Text(
                    context.l10n.refresh,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                  ),
                  color: Theme.of(context).primaryColor,
                  onTap: () async {
                    final wifiEnabled = await Connection.status();
                    if (!wifiEnabled) {
                      return;
                    }
                    if (!context.mounted) {
                      return;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
