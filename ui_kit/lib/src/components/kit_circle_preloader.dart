import 'package:flutter/material.dart';

class KitCirclePreloader extends StatelessWidget {
  const KitCirclePreloader({
    this.child,
    this.isLoading = true,
    this.size = 16,
    super.key,
  });

  final double size;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: isLoading
          ? SizedBox(
              width: size,
              height: size,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                ),
              ),
            )
          : child ?? SizedBox(width: size, height: size),
    );
  }
}
