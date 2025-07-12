import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading10 extends StatefulWidget {
  const ShimmerLoading10({final Key? key, this.shimmerColor}) : super(key: key);
  final Color? shimmerColor;

  @override
  ShimmerLoading10State createState() => ShimmerLoading10State();
}

class ShimmerLoading10State extends State<ShimmerLoading10> {
  final double _spaceHeight = 10.r;
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    return Container(child: buildShimmerCategory());
  }

  Widget buildShimmerCategory() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
      primary: false,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      crossAxisCount: 4,
      children: List.generate(8, (final index) {
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
