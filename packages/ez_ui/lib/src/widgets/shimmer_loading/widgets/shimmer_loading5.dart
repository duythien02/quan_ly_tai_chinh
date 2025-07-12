import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading5 extends StatefulWidget {
  const ShimmerLoading5({
    final Key? key,
    this.shimmerColor,
    this.shimmerColorDark,
  }) : super(key: key);
  final Color? shimmerColor;
  final Color? shimmerColorDark;

  @override
  ShimmerLoading5State createState() => ShimmerLoading5State();
}

class ShimmerLoading5State extends State<ShimmerLoading5> {
  final double _spaceHeight = 10.r;
  final Color _shimmerColor = Colors.grey[200]!;
  final Color _shimmerColorDark = Colors.grey[500]!;

  @override
  Widget build(final BuildContext context) {
    return Container(
      child: buildShimmerProductDiscount2(
        ((MediaQuery.of(context).size.width) - 24) / 2 - 12,
      ),
    );
  }

  Widget buildShimmerProductDiscount2(final double boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
      primary: false,
      childAspectRatio: 4 / 6.7,
      shrinkWrap: true,
      crossAxisSpacing: 8.r,
      mainAxisSpacing: 8.r,
      crossAxisCount: 2,
      children: List.generate(8, (final index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  buildWhiteShimmer(boxImageSize),
                  buildBlackShimmer(),
                ],
              ),
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
                      buildShimmerContainer(),
                      SizedBox(height: _spaceHeight),
                      buildShimmerContainer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildShimmerContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.shimmerColor ?? _shimmerColor,
      ),
      height: 12.r,
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
    return Positioned(
      right: 0,
      top: 10.r,
      child: Shimmer.fromColors(
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
      ),
    );
  }
}
