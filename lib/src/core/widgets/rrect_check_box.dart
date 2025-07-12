// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../core/utils/utils.dart';

class RRectCheckboxTitle extends StatelessWidget {
  const RRectCheckboxTitle({
    final Key? key,
    required this.onChanged,
    required this.value,
    required this.size,
    this.title,
    this.borderRadius,
  }) : super(key: key);

  final void Function({bool value}) onChanged;

  final bool value;

  final double size;

  final String? title;

  final double? borderRadius;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).dividerColor,
      highlightColor: Theme.of(context).dividerColor,
      onTap: () => onChanged.call(value: !value),
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: value
                  ? Theme.of(context).primaryColor
                  : AppColors.transparent,
              border: Border.all(
                color: value
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius?.r ?? 1.r),
              ),
            ),
            child: Center(
              child: value
                  ? Icon(
                      Icons.check,
                      size: size * 0.8,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 10 / 375),
          Expanded(
            child: AutoSizeText(
              Utils.nullSafety(title),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
