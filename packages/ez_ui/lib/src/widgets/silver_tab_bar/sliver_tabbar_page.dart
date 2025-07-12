/*
This is sliver tab bar page
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverTabbarPage extends StatefulWidget {
  const SliverTabbarPage({
    final Key? key,
    required this.tabBarList,
    required this.tabContentList,
    this.tabController,
    this.titleWidget,
  }) : super(key: key);
  final List<Tab> tabBarList;
  final List<Widget> tabContentList;
  final TabController? tabController;
  final Widget? titleWidget;
  @override
  SliverTabbarPageState createState() => SliverTabbarPageState();
}

class SliverTabbarPageState extends State<SliverTabbarPage>
    with SingleTickerProviderStateMixin {
  late TabBar _tabBar;
  int _tabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = widget.tabController ??
        TabController(
          vsync: this,
          length: widget.tabBarList.length,
          initialIndex: _tabIndex,
        );
    _tabBar = TabBar(tabs: widget.tabBarList);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: DefaultTabController(
        length: widget.tabBarList.length,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (final context, final value) {
            return [
              SliverAppBar(
                iconTheme: const IconThemeData(
                  color: Colors.black, //change your color here
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                floating: true,
                pinned: true,
                centerTitle: true,
                title: widget.titleWidget,
                bottom: PreferredSize(
                  preferredSize:
                      Size.fromHeight(_tabBar.preferredSize.height + 1),
                  child: Column(
                    children: [
                      _tabBar = TabBar(
                        controller: _tabController,
                        onTap: (final position) {
                          setState(() {
                            _tabIndex = position;
                          });
                          //log('idx : '+_tabIndex.toString());
                        },
                        isScrollable: true,
                        labelColor: Theme.of(context).primaryColor,
                        labelStyle: const TextStyle(fontSize: 14),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 4,
                        indicatorColor: Theme.of(context).primaryColor,
                        unselectedLabelColor:
                            Theme.of(context).unselectedWidgetColor,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        tabs: widget.tabBarList,
                      ),
                      Container(
                        color: Colors.grey[200],
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.tabContentList.map((final content) {
              return content;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
