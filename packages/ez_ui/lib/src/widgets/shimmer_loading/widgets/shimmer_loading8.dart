import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading8 extends StatefulWidget {
  const ShimmerLoading8({final Key? key, this.shimmerColor}) : super(key: key);
  final Color? shimmerColor;

  @override
  ShimmerLoading8State createState() => ShimmerLoading8State();
}

class ShimmerLoading8State extends State<ShimmerLoading8> {
  final double _spaceHeight = 10.r;
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    return Container(
      child: buildShimmerProduct(
        ((MediaQuery.of(context).size.width) - 24) / 2 - 12,
      ),
    );
  }

  Widget buildShimmerProduct(final double boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
      primary: false,
      childAspectRatio: 5 / 8,
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
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: widget.shimmerColor ?? _shimmerColor,
            period: const Duration(milliseconds: 1000),
            child: Column(
              children: <Widget>[
                buildClip(boxImageSize),
                Container(
                  margin: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildShimmerContainer(),
                      SizedBox(height: _spaceHeight),
                      buildShimmerContainer(),
                      SizedBox(height: _spaceHeight),
                      buildShimmerContainer(width: 50.r),
                      SizedBox(height: _spaceHeight),
                      buildShimmerIcon(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerIcon() {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(
            Icons.star,
            color: widget.shimmerColor ?? _shimmerColor,
            size: 12.r,
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

  Widget buildClip(final double boxImageSize) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        width: boxImageSize,
        height: boxImageSize,
        color: widget.shimmerColor ?? _shimmerColor,
      ),
    );
  }
}
