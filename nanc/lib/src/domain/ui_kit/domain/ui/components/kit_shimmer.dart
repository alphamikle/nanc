import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:nanc_tools/nanc_tools.dart';

class KitShimmer extends StatelessWidget {
  const KitShimmer({
    required this.child,
    this.color,
    super.key,
  });

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color ?? const Color.fromRGBO(224, 224, 224, 1),
      highlightColor: color?.shift(20) ?? const Color.fromRGBO(245, 245, 245, 1),
      child: child,
    );
  }
}
