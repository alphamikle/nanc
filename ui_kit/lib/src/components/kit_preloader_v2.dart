import 'package:flutter/material.dart';

class KitPreloaderV2 extends StatelessWidget {
  const KitPreloaderV2({
    required this.isLoading,
    super.key,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: const LinearProgressIndicator(minHeight: 3, value: 0),
      secondChild: const LinearProgressIndicator(minHeight: 3),
    );
  }
}
