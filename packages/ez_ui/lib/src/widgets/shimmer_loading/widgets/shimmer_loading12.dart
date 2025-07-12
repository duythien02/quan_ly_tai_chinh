import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading12 extends StatefulWidget {
  const ShimmerLoading12({final Key? key, this.height, this.shimmerColor})
      : super(key: key);
  final double? height;
  final Color? shimmerColor;

  @override
  ShimmerLoading12State createState() => ShimmerLoading12State();
}

class ShimmerLoading12State extends State<ShimmerLoading12> {
  final double _containerHeight = 20.r;
  final double _spaceHeight = 10.r;
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(height: widget.height ?? 200.r, child: buildShimmerList());
  }

  Widget buildShimmerList() {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: widget.shimmerColor ?? _shimmerColor,
      period: const Duration(milliseconds: 1000),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.r),
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
                SizedBox(height: _spaceHeight),
                buildShimmerContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.shimmerColor ?? _shimmerColor,
      ),
      height: _containerHeight,
    );
  }
}
