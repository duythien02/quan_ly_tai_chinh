import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EzLinearIndicator extends StatelessWidget {
  const EzLinearIndicator({
    super.key,
    this.width,
    this.lineHeight = 14,
    required this.percent,
    this.backgroundColor,
    this.progressColor,
    this.barRadius,
    this.reverse = false,
    this.onAnimationEnd,
    this.leading,
    this.center,
    this.trailing,
    this.animation = false,
    this.linearGradient,
    this.maskFilter,
    this.widgetIndicator,
  });

  final double? width;
  final double lineHeight;
  final double percent;
  final Color? backgroundColor;
  final Color? progressColor;
  final Widget? leading;
  final Widget? center;
  final Widget? trailing;
  final bool animation;
  final LinearGradient? linearGradient;
  final Radius? barRadius;
  final MaskFilter? maskFilter;
  final bool reverse;
  final void Function()? onAnimationEnd;
  final Widget? widgetIndicator;

  @override
  Widget build(final BuildContext context) {
    return LinearPercentIndicator(
      width: width,
      padding: EdgeInsets.zero,
      lineHeight: lineHeight,
      percent: percent,
      backgroundColor: backgroundColor ?? Theme.of(context).disabledColor,
      progressColor: progressColor ?? Theme.of(context).primaryColor,
      leading: leading,
      center: center,
      trailing: trailing,
      animation: animation,
      animationDuration: 1000,
      linearGradient: linearGradient,
      barRadius: barRadius,
      maskFilter: maskFilter,
      isRTL: reverse,
      onAnimationEnd: onAnimationEnd,
      widgetIndicator: widgetIndicator,
      addAutomaticKeepAlive: false,
    );
  }
}
