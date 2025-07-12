import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class NavigationBackdropPage extends StatefulWidget {
  const NavigationBackdropPage({
    final Key? key,
    required this.items,
    this.title,
  }) : super(key: key);

  final String? title;
  final List<NavigationBackdropItem> items;

  @override
  NavigationBackdropPageState createState() => NavigationBackdropPageState();
}

class NavigationBackdropPageState extends State<NavigationBackdropPage> {
  int _currentIndex = 0;

  @override
  Widget build(final BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text(widget.title ?? ''),
        actions: const <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          ),
        ],
      ),
      stickyFrontLayer: true,
      frontLayer: widget.items[_currentIndex].page,
      backLayer: BackdropNavigationBackLayer(
        items: widget.items
            .map(
              (final e) => ListTile(
                title: Text(
                  e.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
        onTap: (final position) => {setState(() => _currentIndex = position)},
      ),
    );
  }
}

class NavigationBackdropItem {
  const NavigationBackdropItem({
    required this.name,
    required this.page,
  });

  final String name;
  final Widget page;
}
