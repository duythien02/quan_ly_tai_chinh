import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSliderSection extends StatelessWidget {
  const HorizontalSliderSection({
    super.key,
    required this.title,
    this.trailing,
    required this.items,
    this.itemPadding = EdgeInsets.zero,
  });

  final String title;
  final Widget? trailing;
  final List<Widget> items;
  final EdgeInsetsGeometry itemPadding;

  @override
  Widget build(final BuildContext context) {
    if (items.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleAndViewAll(context),
          SizedBox(height: 16.r),
          _buildListItem(),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildTitleAndViewAll(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.r, right: 16.r),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AutoSizeText(
              title,
              maxLines: 1,
              minFontSize: 21,
              maxFontSize: 22,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(width: 16.r),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }

  Widget _buildListItem() {
    return SizedBox(
      height: 250.r,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (final context, final index) {
          return Padding(
            padding: itemPadding,
            child: items[index],
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
