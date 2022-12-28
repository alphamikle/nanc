import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KitShimmer extends StatelessWidget {
  const KitShimmer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(224, 224, 224, 1),
      highlightColor: const Color.fromRGBO(245, 245, 245, 1),
      child: child,
    );
  }
}
