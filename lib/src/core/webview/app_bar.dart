// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ez_ui/ez_ui.dart';

// Project imports:
import '../utils/string_helper.dart';

BoxDecoration getBoxDecorAppBar(final BuildContext context) {
  return BoxDecoration(color: Theme.of(context).colorScheme.surface);
}

Widget buildAppBarLeading(
  final BuildContext context,
  final Function() onBack, {
  required final bool canBack,
}) {
  return SizedBox(
    width: 150,
    child: Row(
      children: <Widget>[
        IconButton(
          highlightColor: Theme.of(context).dividerColor,
          splashColor: Theme.of(context).dividerColor,
          icon: Icon(
            Icons.close,
            color: Theme.of(context).splashColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          highlightColor: Theme.of(context).dividerColor,
          splashColor: Theme.of(context).dividerColor,
          icon: Icon(
            Icons.arrow_back,
            color: canBack
                ? Theme.of(context).splashColor
                : const Color(0xffc1c1c1),
            size: 30,
          ),
          onPressed: () {
            onBack();
          },
        ),
      ],
    ),
  );
}

Widget buildAppBarTitle(final BuildContext context, final String title) {
  return AutoSizeText(
    title.capitalize(),
    overflow: TextOverflow.ellipsis,
    maxFontSize: 18,
    minFontSize: 18,
    maxLines: 1,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: Theme.of(context).splashColor,
      letterSpacing: -0.5,
    ),
  );
}

PreferredSizeWidget buildAppBarWebView(
  final BuildContext context, {
  required final bool canBack,
  required final String title,
  required final Function() onBack,
}) {
  final Widget w = Container(
    decoration: getBoxDecorAppBar(context),
    child: AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      titleSpacing: 0,
      elevation: 0,
      primary: false,
      title: buildAppBarTitle(
        context,
        title,
      ),
      leadingWidth: 150,
      leading: buildAppBarLeading(context, onBack, canBack: canBack),
      centerTitle: true,
    ),
  );

  return PreferredSize(
    preferredSize: Size(double.infinity, AppBar().preferredSize.height),
    child: Material(
      color: AppColors.transparent,
      child: Container(
        padding: EdgeInsets.only(top: getStatusBarHeight(context)),
        decoration: getBoxDecorAppBar(context),
        child: w,
      ),
    ),
  );
}

double getStatusBarHeight(final BuildContext context) {
  return MediaQuery.of(context).padding.top;
}
