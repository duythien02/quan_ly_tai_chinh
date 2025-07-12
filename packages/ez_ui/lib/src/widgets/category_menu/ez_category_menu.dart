import 'package:flutter/material.dart';

import 'category_item.dart';

class EzCategoryMenu extends StatelessWidget {
  const EzCategoryMenu({
    super.key,
    required this.items,
    this.childAspectRatio = 1.04,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisCount = 4,
    this.scrollDirection = Axis.vertical,
  });

  final List<CategoryMenuItem> items;
  final EdgeInsetsGeometry? padding;
  final double childAspectRatio;
  final int crossAxisCount;
  final Axis scrollDirection;

  @override
  Widget build(final BuildContext context) {
    return GridView.count(
      padding: padding,
      primary: false,
      childAspectRatio: childAspectRatio,
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      scrollDirection: scrollDirection,
      children: items,
    );
  }
}
