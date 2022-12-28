import 'package:flutter/material.dart';

class KitColumn extends StatelessWidget {
  const KitColumn({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    super.key,
  });

  final List<Widget> children;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: mainAxisSize,
      children: children,
    );
  }
}
