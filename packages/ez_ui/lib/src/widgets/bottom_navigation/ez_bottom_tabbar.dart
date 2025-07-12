import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EzBottomTabbar extends StatefulWidget {
  const EzBottomTabbar({
    final Key? key,
    required this.tabbarItems,
    this.appbar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  final List<TabbarItem> tabbarItems;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  EzBottomTabbarState createState() => EzBottomTabbarState();
}

class EzBottomTabbarState extends State<EzBottomTabbar> {
  final _pageController = PageController();
  var _currentIndex = 0;

  @override
  void initState() {
    // set initial pages for navigation to home page
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
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (final value) {
          _currentIndex = value;
          _pageController.jumpToPage(value);

          // this unfocus is to prevent show keyboard in the text field
          FocusScope.of(context).unfocus();
        },
        selectedFontSize: 8.sp,
        unselectedFontSize: 8.sp,
        iconSize: 28.r,
        items: widget.tabbarItems
            .mapIndexed(
              (final index, final e) => BottomNavigationBarItem(
                activeIcon: Text(
                  e.tab.name,
                  style: TextStyle(
                    color: _currentIndex == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).unselectedWidgetColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: e.tab.icon,
              ),
            )
            .toList(),
      ),
    );
  }
}

class TabbarItem {
  const TabbarItem({
    required this.tab,
    required this.content,
  });

  final NavBarItem tab;
  final Widget content;
}

class NavBarItem {
  const NavBarItem({
    required this.name,
    required this.icon,
  });

  final String name;
  final Widget icon;
}
