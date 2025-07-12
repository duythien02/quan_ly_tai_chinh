import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading4 extends StatefulWidget {
  const ShimmerLoading4({
    final Key? key,
    this.height,
    this.shimmerColor,
    this.shimmerColorDark,
  }) : super(key: key);
  final Color? shimmerColor;
  final Color? shimmerColorDark;

  final double? height;
  @override
  ShimmerLoading4State createState() => ShimmerLoading4State();
}

class ShimmerLoading4State extends State<ShimmerLoading4> {
  final double _spaceHeight = 10.r;
  final _shimmerColor = Colors.grey[200]!;
  final _shimmerColorDark = Colors.grey[500]!;

  @override
  Widget build(final BuildContext context) {
    final boxImageSize = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      height: widget.height ?? boxImageSize * 1.90,
      child: buildShimmerProductDiscount(
        widget.height != null ? (widget.height! / 1.9) : boxImageSize,
      ),
    );
  }

  Widget buildShimmerProductDiscount(final double boxImageSize) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      scrollDirection: Axis.horizontal,
      itemBuilder: (final context, final index) {
        return Container(
          margin: EdgeInsets.only(left: (index == 0 ? 0 : 8).r),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Colors.white,
            child: SizedBox(
              width: boxImageSize,
              height: boxImageSize,
              child: Column(
                children: <Widget>[
                  buildTopSectionShimmer(boxImageSize),
                  Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: widget.shimmerColor ?? _shimmerColor,
                    period: const Duration(milliseconds: 1000),
                    child: Container(
                      margin: EdgeInsets.all(8.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildShimmerContainer(),
                          SizedBox(height: _spaceHeight),
                          buildShimmerContainer(),
                          SizedBox(height: _spaceHeight),
                          buildShimmerContainer(width: 50),
                          SizedBox(height: _spaceHeight),
                          buildShimmerContainer(width: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTopSectionShimmer(final double boxImageSize) {
    return Stack(
      children: [
        buildWhiteShimmer(boxImageSize),
        Positioned(
          right: 0,
          top: 10.r,
          child: buildBlackShimmer(),
        ),
      ],
    );
  }

  Widget buildShimmerContainer({final double? width}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.shimmerColor ?? _shimmerColor,
      ),
      height: 12.r,
      width: width,
    );
  }

  Widget buildWhiteShimmer(final double boxImageSize) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: widget.shimmerColor ?? _shimmerColor,
      period: const Duration(milliseconds: 1000),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Container(
          width: boxImageSize,
          height: boxImageSize,
          color: widget.shimmerColor ?? _shimmerColor,
        ),
      ),
    );
  }

  Widget buildBlackShimmer() {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: widget.shimmerColorDark ?? _shimmerColorDark,
      period: const Duration(milliseconds: 1000),
      child: Container(
        decoration: BoxDecoration(
          color: widget.shimmerColorDark ?? _shimmerColorDark,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
        child: SizedBox(width: 20.r, height: 12.r),
      ),
    );
  }
}
