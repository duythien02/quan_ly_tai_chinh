import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading1 extends StatefulWidget {
  const ShimmerLoading1({final Key? key, this.shimmerColor}) : super(key: key);
  final Color? shimmerColor;

  @override
  ShimmerLoading1State createState() => ShimmerLoading1State();
}

class ShimmerLoading1State extends State<ShimmerLoading1> {
  final double _containerHeight = 20.r;
  final double _spaceHeight = 10.r;
  final _shimmerColor = Colors.grey[200]!;

  @override
  Widget build(final BuildContext context) {
    return buildShimmerContent();
  }

  Widget buildShimmerContent() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 8,
      itemBuilder: (final context, final index) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20.r, 20.r, 20.r, 0.r),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: widget.shimmerColor ?? _shimmerColor,
                period: const Duration(milliseconds: 1000),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.shimmerColor ?? _shimmerColor,
                      ),
                      height: 110.r,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: Container(width: 80.r),
                      ),
                    ),
                    SizedBox(width: 20.r),
                    buildShimmerContentBody(),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.r),
              color: widget.shimmerColor ?? _shimmerColor,
              height: 1.r,
            ),
          ],
        );
      },
    );
  }

  Widget buildShimmerContentBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5.r),
            padding: EdgeInsets.only(left: 12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.shimmerColor ?? _shimmerColor,
            ),
            height: _containerHeight,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: _spaceHeight),
          buildShimmerContainer(),
          SizedBox(height: _spaceHeight),
          buildShimmerContainer(),
        ],
      ),
    );
  }

  Widget buildShimmerContainer() {
    return Container(
      padding: EdgeInsets.only(left: 12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.shimmerColor ?? _shimmerColor,
      ),
      height: _containerHeight,
      width: 100.r,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
