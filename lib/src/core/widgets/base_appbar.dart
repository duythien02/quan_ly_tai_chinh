// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ez_resources/ez_resources.dart';
import 'package:ez_ui/ez_ui.dart';

// Project imports:
import '../../core/utils/string_helper.dart';
import '../../core/utils/utils.dart';

PreferredSizeWidget buildAppBar(final AppBarParams appBarParams) {
  final Widget w = AppBar(
    titleSpacing: 0,
    elevation: appBarParams.elevation,
    primary: false,
    title: appBarParams.titleWidget ??
        buildAppBarTitle(
          AppBarParams(
            appBarParams.context,
            title: Utils.nullSafety(appBarParams.title),
            titleColor: appBarParams.titleColor,
          ),
        ),
    leading: appBarParams.hasBack
        ? (appBarParams.backButton ??
            buildBackButton(
              AppBarParams(
                appBarParams.context,
                onExit: appBarParams.onExit ??
                    () {
                      Navigator.pop(appBarParams.context);
                    },
                titleColor: Utils.textColorByAppBarTheme(appBarParams.context),
              ),
            ))
        : null,
    automaticallyImplyLeading: appBarParams.hasBack,
    centerTitle: appBarParams.centerTitle,
    actions: appBarParams.actions,
    backgroundColor: appBarParams.backgroundColor ??
        Theme.of(appBarParams.context).colorScheme.surface,
    bottom: appBarParams.bottom,
    // brightness: Brightness.light,
  );

  return PreferredSize(
    preferredSize: Size(double.infinity, AppBar().preferredSize.height),
    child: Material(
      elevation: appBarParams.elevation,
      color: AppColors.transparent,
      child: Container(
        padding: EdgeInsets.only(top: getStatusBarHeight(appBarParams.context)),
        decoration: BoxDecoration(
          color: Theme.of(appBarParams.context).colorScheme.surface,
          border: _buildDivider(
            appBarParams.context,
            hasDivider: appBarParams.hasDivider,
          ),
        ),
        child: w,
      ),
    ),
  );
}

Widget buildAppBarTitle(
  final AppBarParams params, {
  final double minFontSize = 15,
}) {
  return AutoSizeText(
    params.title?.capitalize() ?? '',
    overflow: TextOverflow.ellipsis,
    minFontSize: minFontSize,
    maxLines: 1,
    style: Theme.of(params.context).textTheme.titleSmall?.copyWith(
          color:
              params.titleColor ?? Utils.textColorByAppBarTheme(params.context),
          letterSpacing: -0.5,
        ),
  );
}

Widget buildBackButton(
  final AppBarParams params, {
  final double? size,
}) {
  return IconButton(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.centerLeft,
    iconSize: size ?? 24,
    icon: EZResources.image(
      ImageParams(
        name: AppIcons.icBack,
        size: const ImageSize.square(24),
        color: params.titleColor ??
            Theme.of(params.context).appBarTheme.actionsIconTheme?.color,
      ),
    ),
    onPressed: params.onExit,
  );
}

double getAppBarHeight(
  final BuildContext context, {
  final bool inScaffold = false,
}) {
  final height = AppBar().preferredSize.height;

  return height + (inScaffold ? 0 : getStatusBarHeight(context));
}

double getStatusBarHeight(final BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

Border? _buildDivider(
  final BuildContext context, {
  required final bool hasDivider,
}) =>
    hasDivider
        ? Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          )
        : null;

class AppBarParams {
  AppBarParams(
    this.context, {
    this.title,
    this.titleWidget,
    this.onExit,
    this.hasBack = true,
    this.elevation = 0,
    this.actions,
    this.backButton,
    this.centerTitle = true,
    this.bottom,
    this.titleColor,
    this.backgroundColor,
    this.screenName,
    this.hasDivider = false,
  });

  final BuildContext context;
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onExit;
  final bool hasBack;
  final bool hasDivider;
  final double elevation;
  final List<Widget>? actions;
  final Widget? backButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final Color? backgroundColor;
  final String? screenName;
}
