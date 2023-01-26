import 'package:flutter/material.dart';

class KitCirclePreloader extends StatelessWidget {
  const KitCirclePreloader({
    this.child,
    this.isLoading = true,
    this.size = 16,
    this.value,
    this.color,
    super.key,
  });

  final double size;
  final bool isLoading;
  final Widget? child;
  final double? value;
  final Color? color;

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
                  valueColor: color == null ? null : AlwaysStoppedAnimation<Color>(color!),
                ),
              ),
            )
          : child ?? SizedBox(width: size, height: size),
    );
  }
}
