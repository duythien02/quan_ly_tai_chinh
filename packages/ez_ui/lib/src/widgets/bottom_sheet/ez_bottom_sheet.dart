import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

Future<void> showEzBottomSheet(
  final BuildContext context, {
  final String? title,
  required final List<BottomSheetItem> items,
}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    builder: (final context) {
      return EzBottomSheet(title: title, items: items);
    },
  );
}

class EzBottomSheet extends StatefulWidget {
  const EzBottomSheet({
    super.key,
    this.title,
    required this.items,
  });

  final String? title;
  final List<BottomSheetItem> items;

  @override
  State<EzBottomSheet> createState() => _EzBottomSheetState();
}

class _EzBottomSheetState extends State<EzBottomSheet> {
  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 12.r, bottom: 12.r),
              width: 40.r,
              height: 4.r,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: AutoSizeText(
              widget.title ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: ListView.separated(
              itemCount: widget.items.length,
              padding: EdgeInsets.symmetric(vertical: 16.r),
              separatorBuilder: (final _, final __) =>
                  Divider(height: 32.r, color: Theme.of(context).dividerColor),
              itemBuilder: (final _, final index) {
                return buildItem(widget.items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(final BottomSheetItem item) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: item.onTap,
      child: Row(
        children: [
          if (item.img?.isNotEmpty ?? false)
            Container(
              margin: EdgeInsets.only(right: 8.r),
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffcccccc),
                ),
              ),
              child: Image.asset(
                item.img!,
                height: 20.r,
              ),
            ),
          Expanded(child: AutoSizeText(item.name ?? '')),
        ],
      ),
    );
  }
}
