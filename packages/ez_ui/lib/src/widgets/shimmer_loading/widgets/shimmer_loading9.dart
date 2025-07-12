import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading9 extends StatefulWidget {
  const ShimmerLoading9({final Key? key, this.shimmerColor}) : super(key: key);
  final Color? shimmerColor;

  @override
  ShimmerLoading9State createState() => ShimmerLoading9State();
}

class ShimmerLoading9State extends State<ShimmerLoading9> {
  final double _spaceHeight = 10.r;
  final Color _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    return Container(
      child: buildShimmerTrending(MediaQuery.of(context).size.width / 2),
    );
  }

  Widget buildShimmerTrending(final double boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      primary: false,
      childAspectRatio: 4 / 1.6,
      shrinkWrap: true,
      crossAxisSpacing: 2.r,
      mainAxisSpacing: 2.r,
      crossAxisCount: 2,
      children: List.generate(4, (final index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: widget.shimmerColor ?? _shimmerColor,
            period: const Duration(milliseconds: 1000),
            child: Row(
              children: [
                buildClip(boxImageSize),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildShimmerContainer(),
                        SizedBox(height: _spaceHeight),
                        buildShimmerContainer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildClip(final double boxImageSize) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      child: Container(
        width: boxImageSize * (1.6 / 4) - 12 - 1,
        height: boxImageSize * (1.6 / 4) - 12 - 1,
        color: widget.shimmerColor ?? _shimmerColor,
      ),
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
}
