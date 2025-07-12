import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeChip extends StatelessWidget {
  const BadgeChip({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.padding = 8,
    this.color,
  });

  final Widget child;
  final double borderRadius;
  final double padding;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        badgeColor: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
        padding: EdgeInsets.all(padding.r),
        shape: badges.BadgeShape.square,
      ),
      badgeContent: child,
    );
  }
}
