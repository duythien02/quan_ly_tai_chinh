import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class StandardBadge extends StatelessWidget {
  const StandardBadge({
    super.key,
    this.badgeContent,
    this.child,
    this.badgeColor,
    this.isSquare = false,
    this.borderRadius = BorderRadius.zero,
    this.badgeBorderSide = BorderSide.none,
  });

  final Widget? badgeContent;
  final Color? badgeColor;
  final Widget? child;
  final bool isSquare;
  final BorderRadius borderRadius;
  final BorderSide badgeBorderSide;

  @override
  Widget build(final BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeStyle: badges.BadgeStyle(
        shape: isSquare ? badges.BadgeShape.square : badges.BadgeShape.circle,
        badgeColor: badgeColor ?? Theme.of(context).colorScheme.error,
        borderRadius: borderRadius,
        borderSide: badgeBorderSide,
      ),
      badgeAnimation: const badges.BadgeAnimation.slide(
        animationDuration: Duration(milliseconds: 300),
      ),
      badgeContent: badgeContent,
      child: child,
    );
  }
}
