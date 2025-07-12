import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading2 extends StatefulWidget {
  const ShimmerLoading2({this.height, final Key? key, this.shimmerColor})
      : super(key: key);

  final double? height;
  final Color? shimmerColor;

  @override
  ShimmerLoading2State createState() => ShimmerLoading2State();
}

class ShimmerLoading2State extends State<ShimmerLoading2> {
  final _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    final boxImageSize = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      height: widget.height ?? boxImageSize,
      child: buildShimmerImageHorizontal(widget.height ?? boxImageSize),
    );
  }

  Widget buildShimmerImageHorizontal(final double boxImageSize) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 8,
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      scrollDirection: Axis.horizontal,
      itemBuilder: (final context, final index) {
        return Container(
          margin: EdgeInsets.only(left: (index == 0 ? 0 : 12).r),
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: widget.shimmerColor ?? _shimmerColor,
            period: const Duration(milliseconds: 1000),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: boxImageSize,
                height: boxImageSize,
                color: widget.shimmerColor ?? _shimmerColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
