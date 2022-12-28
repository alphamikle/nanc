import 'package:flutter/material.dart';
import 'package:ui_kit/src/components/kit_shimmer.dart';

class KitShimmerSwitcher extends StatelessWidget {
  const KitShimmerSwitcher({
    required this.child,
    this.showShimmer = false,
    super.key,
  });

  final Widget child;
  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: showShimmer ? KitShimmer(child: child) : child,
    );
  }
}
