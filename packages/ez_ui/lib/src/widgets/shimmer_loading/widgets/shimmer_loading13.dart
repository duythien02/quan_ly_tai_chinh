import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading13 extends StatelessWidget {
  const ShimmerLoading13({super.key, this.shimmerColor});

  final Color? shimmerColor;

  @override
  Widget build(final BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerColor ?? Colors.grey.shade300,
      highlightColor: shimmerColor ?? Colors.grey.shade100,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: 8, // Hiển thị 8 item placeholder
        itemBuilder: (final context, final index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder cho icon
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 8),
              // Placeholder cho text
              Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
