import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import '../../../ez_ui.dart';

class DefaultBackdropPage extends StatefulWidget {
  const DefaultBackdropPage({
    final Key? key,
    required this.backLayer,
    required this.frontLayer,
    this.title,
    this.backLayerBackgroundColor,
    this.appBarBackgroundColor,
    this.icon = AnimatedIcons.close_menu,
    this.iconColor,
  }) : super(key: key);

  final Widget backLayer;
  final Widget frontLayer;
  final String? title;
  final AnimatedIconData icon;
  final Color? backLayerBackgroundColor;
  final Color? iconColor;
  final Color? appBarBackgroundColor;

  @override
  DefaultBackdropPageState createState() => DefaultBackdropPageState();
}

class DefaultBackdropPageState extends State<DefaultBackdropPage> {
  @override
  Widget build(final BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text(widget.title ?? ''),
        backgroundColor: widget.appBarBackgroundColor,
        actions: <Widget>[
          BackdropToggleButton(
            icon: widget.icon,
            color: widget.iconColor ?? AppColors.white,
          ),
        ],
      ),
      backLayerBackgroundColor: widget.backLayerBackgroundColor,
      backLayer: widget.backLayer,
      frontLayer: widget.frontLayer,
    );
  }
}
