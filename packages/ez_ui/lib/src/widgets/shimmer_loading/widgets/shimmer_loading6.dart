import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading6 extends StatefulWidget {
  const ShimmerLoading6({
    final Key? key,
    this.bannerWidth,
    this.bannerHeight,
    this.shimmerColor,
  }) : super(key: key);
  final double? bannerWidth;
  final double? bannerHeight;
  final Color? shimmerColor;

  @override
  ShimmerLoading6State createState() => ShimmerLoading6State();
}

class ShimmerLoading6State extends State<ShimmerLoading6> {
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    final bannerWidth = MediaQuery.of(context).size.width;
    final bannerHeight = MediaQuery.of(context).size.width * 6 / 8;

    return Container(
      child: buildShimmerBannerSlider(
        widget.bannerWidth ?? bannerWidth,
        widget.bannerHeight ?? bannerHeight,
      ),
    );
  }

  Widget buildShimmerBannerSlider(
    final double bannerWidth,
    final double bannerHeight,
  ) {
    return Column(
      children: [
        Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: widget.shimmerColor ?? _shimmerColor,
          period: const Duration(milliseconds: 1000),
          child: Container(
            width: bannerWidth,
            height: bannerHeight,
            color: widget.shimmerColor ?? _shimmerColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (final index) {
            return Container(
              width: 8.r,
              height: 8.r,
              margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 2.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.shimmerColor ?? _shimmerColor,
              ),
            );
          }),
        ),
      ],
    );
  }
}
