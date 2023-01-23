import 'package:flutter/material.dart';

class KitCirclePreloader extends StatelessWidget {
  const KitCirclePreloader({
    this.child,
    this.isLoading = true,
    this.size = 16,
    this.value,
    super.key,
  });

  final double size;
  final bool isLoading;
  final Widget? child;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: isLoading
          ? SizedBox(
              width: size,
              height: size,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  value: value,
                ),
              ),
            )
          : child ?? SizedBox(width: size, height: size),
    );
  }
}
