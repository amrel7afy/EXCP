import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerLoading extends StatelessWidget {
  final Widget children;

  const ShimmerLoading({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blue.withOpacity(0.3),
      highlightColor: Colors.blue.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [children],
      ),
    );
  }
}

