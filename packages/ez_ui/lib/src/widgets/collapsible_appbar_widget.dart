// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ez_ui.dart';

double expandedHeight = 150.r;

class CollapsibleAppBarWidget extends StatefulWidget {
  const CollapsibleAppBarWidget({
    final Key? key,
    required this.appBarTitle,
    required this.headerBackground,
    required this.widgetList,
    required this.bottomNavigationBar,
    this.systemOverlayStyle,
    this.backButton,
  }) : super(key: key);

  final String appBarTitle;
  final List<Widget> widgetList;
  final String? headerBackground;
  final Widget bottomNavigationBar;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Widget? backButton;

  @override
  State<CollapsibleAppBarWidget> createState() =>
      _CollapsibleAppBarWidgetState();
}

class _CollapsibleAppBarWidgetState extends State<CollapsibleAppBarWidget> {
  final ScrollController _controller = ScrollController();
  String title = '';

  @override
  void initState() {
    super.initState();
  }

  void _addListener() {
    title = _controller.position.userScrollDirection == ScrollDirection.reverse
        ? widget.appBarTitle
        : '';
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.bottomNavigationBar,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        controller: _controller..addListener(_addListener),
        slivers: <Widget>[
          CollapsibleAppBar(
            appBarTitle: title,
            backgroundImg: widget.headerBackground,
            systemOverlayStyle: widget.systemOverlayStyle,
            backButton: widget.backButton,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 15.r),
              ...widget.widgetList,
            ]),
          ),
        ],
      ),
    );
  }
}

class CollapsibleAppBar extends StatelessWidget {
  const CollapsibleAppBar({
    final Key? key,
    required this.appBarTitle,
    required this.backgroundImg,
    this.systemOverlayStyle,
    this.backButton,
  }) : super(key: key);

  final String appBarTitle;
  final String? backgroundImg;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Widget? backButton;

  @override
  Widget build(final BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: expandedHeight,
      title: Text(
        appBarTitle,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: backButton ??
          IconButton(
            highlightColor: Theme.of(context).dividerColor,
            splashColor: Theme.of(context).dividerColor,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: AppPadding.defaultValue),
            icon: Icon(
              Icons.navigate_before,
              color: Theme.of(context).colorScheme.surface,
              size: 40.r,
            ),
            onPressed: Navigator.of(context).pop,
          ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: EzCachedNetworkImage(
          imageUrl: backgroundImg ?? '',
        ),
      ),
      systemOverlayStyle: systemOverlayStyle,
    );
  }
}
