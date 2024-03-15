import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  const Skelton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(0.09),
      highlightColor: Colors.black.withOpacity(0.04),
      direction: ShimmerDirection.ltr,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}

class CircleSkelton extends StatelessWidget {
  const CircleSkelton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(0.09),
      highlightColor: Colors.black.withOpacity(0.04),
      direction: ShimmerDirection.ltr,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
