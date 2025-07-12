// Flutter imports:
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    final Key? key,
    required this.content,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.padding,
  }) : super(key: key);
  final Widget content;
  final Function() onTap;
  final Color? color;
  final double? width;
  final double? height;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(2),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Material(
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          color: Colors.transparent,
          child: Center(child: content),
        ),
      ),
    );
  }
}
