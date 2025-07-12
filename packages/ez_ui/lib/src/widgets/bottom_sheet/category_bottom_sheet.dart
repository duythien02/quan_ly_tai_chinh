import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

Future<void> showCategoryBottomSheet(
  final BuildContext context, {
  required final String title,
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
      return CategoryBottomSheet(title: title, items: items);
    },
  );
}

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<BottomSheetItem> items;

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  @override
  Widget build(final BuildContext context) {
    return Column(
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
          child: AutoSizeText(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: GridView.count(
            padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0.r),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: List.generate(widget.items.length, buildPopupItem),
          ),
        ),
      ],
    );
  }

  Widget buildPopupItem(final int index) {
    final item = widget.items[index];

    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        children: [
          ClipOval(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(10),
              child: EzCachedNetworkImage(
                width: 20.r,
                height: 20.r,
                imageUrl: item.img ?? '',
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 8.r),
              child: AutoSizeText(
                item.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetItem {
  BottomSheetItem({
    this.name,
    this.img,
    this.onTap,
    this.id,
  });

  final String? name;
  final String? img;
  final void Function()? onTap;
  final String? id;
}
