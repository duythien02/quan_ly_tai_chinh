import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading7 extends StatefulWidget {
  const ShimmerLoading7({
    final Key? key,
    this.bannerWidth,
    this.bannerHeight,
    this.shimmerColor,
  }) : super(key: key);
  final double? bannerWidth;
  final double? bannerHeight;
  final Color? shimmerColor;

  @override
  ShimmerLoading7State createState() => ShimmerLoading7State();
}

class ShimmerLoading7State extends State<ShimmerLoading7> {
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    final bannerWidth = MediaQuery.of(context).size.width;
    final bannerHeight = MediaQuery.of(context).size.width / 2;

    return Container(
      child: buildShimmerBanner(
        widget.bannerWidth ?? bannerWidth,
        widget.bannerHeight ?? bannerHeight,
      ),
    );
  }

  Widget buildShimmerBanner(
    final double bannerWidth,
    final double bannerHeight,
  ) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: widget.shimmerColor ?? _shimmerColor,
      period: const Duration(milliseconds: 1000),
      child: Container(
        width: bannerWidth,
        height: bannerHeight,
        color: widget.shimmerColor ?? _shimmerColor,
      ),
    );
  }
}
