import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading11 extends StatefulWidget {
  const ShimmerLoading11({final Key? key, this.shimmerColor}) : super(key: key);
  final Color? shimmerColor;

  @override
  ShimmerLoading11State createState() => ShimmerLoading11State();
}

class ShimmerLoading11State extends State<ShimmerLoading11> {
  final double _spaceHeight = 10.r;
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(height: 200.r, child: buildShimmerCategoryHorizontal());
  }

  Widget buildShimmerCategoryHorizontal() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
      primary: false,
      childAspectRatio: 1.07,
      shrinkWrap: true,
      crossAxisCount: 2,
      scrollDirection: Axis.horizontal,
      children: List.generate(16, (final index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: widget.shimmerColor ?? _shimmerColor,
          period: const Duration(milliseconds: 1000),
          child: Column(
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                color: widget.shimmerColor ?? _shimmerColor,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                width: 60.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.shimmerColor ?? _shimmerColor,
                ),
                height: 12.r,
              ),
            ],
          ),
        );
      }),
    );
  }
}
