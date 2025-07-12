import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

class CategoryMenu {
  const CategoryMenu({
    this.name,
    this.imgSize,
    this.img,
  });

  final String? name;
  final double? imgSize;
  final String? img;
}

// StandardCategoryItem, BorderCategoryItem,
// ImageBorderCategoryItem, CardCategoryItem
abstract class CategoryMenuItem extends StatelessWidget {
  const CategoryMenuItem({
    super.key,
    required this.onTap,
    required this.data,
  });

  final CategoryMenu data;
  final void Function() onTap;
}

class StandardCategoryItem extends CategoryMenuItem {
  const StandardCategoryItem({
    super.key,
    required super.onTap,
    required super.data,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          EzCachedNetworkImage(
            width: data.imgSize ?? 40.r,
            height: data.imgSize ?? 40.r,
            imageUrl: data.img ?? '',
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 10.r),
              child: AutoSizeText(
                data.name ?? '',
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

class BorderCategoryItem extends CategoryMenuItem {
  const BorderCategoryItem({
    super.key,
    required super.onTap,
    required super.data,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).dividerColor, width: 0.5.r),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: EdgeInsets.all(8.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EzCachedNetworkImage(
                width: data.imgSize ?? 24.r,
                height: data.imgSize ?? 24.r,
                imageUrl: data.img ?? '',
              ),
              Container(
                margin: EdgeInsets.only(top: 12.r),
                child: AutoSizeText(
                  data.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageBorderCategoryItem extends CategoryMenuItem {
  const ImageBorderCategoryItem({
    super.key,
    required super.onTap,
    required super.data,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              padding: EdgeInsets.all(10.r),
              child: EzCachedNetworkImage(
                width: data.imgSize ?? 20.r,
                height: data.imgSize ?? 20.r,
                imageUrl: data.img ?? '',
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 8.r),
              child: AutoSizeText(
                data.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
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

class CardCategoryItem extends CategoryMenuItem {
  const CardCategoryItem({
    super.key,
    required super.onTap,
    required super.data,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EzCachedNetworkImage(
              width: data.imgSize ?? 40.r,
              height: data.imgSize ?? 40.r,
              imageUrl: data.img ?? '',
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 16.r),
                child: AutoSizeText(
                  data.name ?? '',
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
      ),
    );
  }
}
