import 'package:flutter/material.dart';
export 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../widgets.dart';

class CustomBottomTabbar extends StatefulWidget {
  const CustomBottomTabbar({
    final Key? key,
    required this.tabbarItems,
    this.appbar,
    this.tabStyle,
    this.initialActiveIndex,
    this.backgroundColor,
    this.activeColor,
    this.color,
    this.gradient,
    this.badge,
  }) : super(key: key);

  final List<TabbarItem> tabbarItems;
  final PreferredSizeWidget? appbar;
  final TabStyle? tabStyle;
  final int? initialActiveIndex;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? color;
  final Gradient? gradient;
  final Map<int, String>? badge;

  @override
  CustomBottomTabbarState createState() => CustomBottomTabbarState();
}

class CustomBottomTabbarState extends State<CustomBottomTabbar> {
  late PageController _pageController;

  @override
  void initState() {
    // set initial pages for navigation to home page
    _pageController = PageController();
    _pageController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.appbar,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.tabbarItems.map((final e) {
          return e.content;
        }).toList(),
      ),
      bottomNavigationBar: buildAppbar(),
    );
  }

  Widget buildAppbar() {
    final badge = widget.badge;
    if (badge != null) {
      return ConvexAppBar.badge(
        badge,
        badgePadding: const EdgeInsets.only(left: 7, right: 7),
        badgeColor: Theme.of(context).colorScheme.error,
        badgeBorderRadius: 20,
        badgeMargin: const EdgeInsets.only(bottom: 20, left: 40),
        style: widget.tabStyle,
        backgroundColor: widget.backgroundColor,
        color: widget.color,
        activeColor: widget.activeColor,
        gradient: widget.gradient,
        items: widget.tabbarItems
            .map(
              (final e) => TabItem<dynamic>(
                icon: e.tab.icon,
                title: e.tab.name,
              ),
            )
            .toList(),
        initialActiveIndex: widget.initialActiveIndex, //optional, default as 0
        onTap: _tapNav,
      );
    }

    return ConvexAppBar(
      style: widget.tabStyle,
      backgroundColor: widget.backgroundColor,
      color: widget.color,
      activeColor: widget.activeColor,
      gradient: widget.gradient,
      items: widget.tabbarItems
          .map(
            (final e) => TabItem<dynamic>(
              icon: e.tab.icon,
              title: e.tab.name,
            ),
          )
          .toList(),
      initialActiveIndex: widget.initialActiveIndex, //optional, default as 0
      onTap: _tapNav,
    );
  }

  void _tapNav(final int index) {
    _pageController.jumpToPage(index);

    // this unfocus is to prevent show keyboard in the text field
    FocusScope.of(context).unfocus();
  }
}
