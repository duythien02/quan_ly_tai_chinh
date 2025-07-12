import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    super.key,
    required this.items,
    this.onTap,
    this.indicatorShape = BoxShape.circle,
    this.borderRadius = BorderRadius.zero,
    this.isIndicatorStacked = false,
    this.aspectRatio = 8 / 6,
    this.viewportFraction = 1,
    this.autoPlay = true,
    this.scrollDirection = Axis.horizontal,
    this.indicatorScale = 1,
    this.indicatorRadius,
    this.bannerPadding,
    this.indicatorWidth = 8,
    this.indicatorHeight = 8,
  });

  final List<BannerItem> items;
  final void Function(String?)? onTap;
  final BoxShape indicatorShape;
  final BorderRadius borderRadius;
  final bool isIndicatorStacked;
  final double aspectRatio;
  final double viewportFraction;
  final bool autoPlay;
  final Axis scrollDirection;
  final double indicatorScale;
  final BorderRadius? indicatorRadius;
  final EdgeInsetsGeometry? bannerPadding;
  final double indicatorWidth;
  final double indicatorHeight;

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  var _currentImageSlider = 0;

  @override
  Widget build(final BuildContext context) {
    if (widget.isIndicatorStacked) {
      return Stack(
        children: [
          buildCarousel(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildIndicators(),
          ),
        ],
      );
    }

    return Column(
      children: [
        buildCarousel(),
        buildIndicators(),
      ],
    );
  }

  Widget buildCarousel() {
    return CarouselSlider(
      items: widget.items
          .map(
            (final item) => GestureDetector(
              onTap: () => widget.onTap?.call(item.id),
              child: Container(
                padding: widget.bannerPadding,
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: EzCachedNetworkImage(
                    width: 0,
                    height: 0,
                    imageUrl: item.image ?? '',
                  ),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        scrollDirection: widget.scrollDirection,
        aspectRatio: widget.aspectRatio,
        viewportFraction: widget.viewportFraction,
        autoPlay: widget.autoPlay,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 300),
        onPageChanged: (final index, final reason) {
          setState(() {
            _currentImageSlider = index;
          });
        },
      ),
    );
  }

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.items.map((final item) {
        final index = widget.items.indexOf(item);
        final isCurrent = _currentImageSlider == index;

        return Container(
          width: (isCurrent
                  ? (widget.indicatorWidth * widget.indicatorScale)
                  : widget.indicatorWidth)
              .r,
          height: widget.indicatorHeight,
          margin: EdgeInsets.symmetric(
            vertical: 10.r,
            horizontal: 2.r,
          ),
          decoration: BoxDecoration(
            shape: widget.indicatorShape,
            borderRadius: widget.indicatorRadius,
            color: isCurrent
                ? Theme.of(context).primaryColor
                : Theme.of(context).unselectedWidgetColor,
          ),
        );
      }).toList(),
    );
  }
}

class BannerItem {
  const BannerItem({
    required this.id,
    this.name,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? image;
}
