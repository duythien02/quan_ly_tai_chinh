import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading3 extends StatefulWidget {
  const ShimmerLoading3({final Key? key, this.height, this.shimmerColor})
      : super(key: key);

  final double? height;
  final Color? shimmerColor;

  @override
  ShimmerLoading3State createState() => ShimmerLoading3State();
}

class ShimmerLoading3State extends State<ShimmerLoading3> {
  final double _spaceHeight = 10.r;
  final _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    final boxImageSize = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      height: widget.height ?? boxImageSize * 1.90,
      child: buildShimmerHorizontalProduct(
        widget.height != null ? (widget.height! / 1.9) : boxImageSize,
      ),
    );
  }

  Widget buildShimmerHorizontalProduct(final double boxImageSize) {
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
            color: Theme.of(context).colorScheme.surface,
            child: Shimmer.fromColors(
              highlightColor: Theme.of(context).colorScheme.surface,
              baseColor: widget.shimmerColor ?? _shimmerColor,
              period: const Duration(milliseconds: 1000),
              child: SizedBox(
                width: boxImageSize,
                height: boxImageSize,
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
                          buildIcon(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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

  Widget buildIcon() {
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
}
