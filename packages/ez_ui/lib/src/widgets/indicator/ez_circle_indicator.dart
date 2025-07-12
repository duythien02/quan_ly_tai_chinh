import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EzCircleIndicator extends StatelessWidget {
  const EzCircleIndicator({
    super.key,
    required this.radius,
    this.lineWidth = 5,
    required this.percent,
    this.backgroundColor,
    this.progressColor,
    this.header,
    this.footer,
    this.center,
    this.animation = false,
    this.isRoundIndicatorCap = true,
    this.linearGradient,
    this.maskFilter,
    this.startAngle = 0.0,
    this.widgetIndicator,
    this.reverse = false,
    this.backgroundWidth = -1,
    this.onAnimationEnd,
    this.isHalfShape = false,
  });

  final double radius;
  final double lineWidth;
  final double percent;
  final Color? backgroundColor;
  final Color? progressColor;
  final Widget? header;
  final Widget? footer;
  final Widget? center;
  final bool animation;
  final LinearGradient? linearGradient;
  final bool isRoundIndicatorCap;
  final MaskFilter? maskFilter;
  final double startAngle;
  final Widget? widgetIndicator;
  final bool reverse;
  final double backgroundWidth;
  final void Function()? onAnimationEnd;
  final bool isHalfShape;

  @override
  Widget build(final BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: lineWidth,
      percent: percent,
      backgroundColor:
          backgroundColor ?? Theme.of(context).unselectedWidgetColor,
      backgroundWidth: backgroundWidth,
      progressColor: progressColor ?? Theme.of(context).primaryColor,
      circularStrokeCap: isRoundIndicatorCap
          ? CircularStrokeCap.round
          : CircularStrokeCap.square,
      footer: footer,
      header: header,
      center: center,
      animation: animation,
      animationDuration: 1000,
      linearGradient: linearGradient,
      maskFilter: maskFilter,
      startAngle: startAngle,
      widgetIndicator: widgetIndicator,
      reverse: reverse,
      onAnimationEnd: onAnimationEnd,
      arcType: isHalfShape ? ArcType.HALF : null,
      arcBackgroundColor: isHalfShape
          ? (backgroundColor ?? Theme.of(context).unselectedWidgetColor)
          : null,
      addAutomaticKeepAlive: false,
    );
  }
}
