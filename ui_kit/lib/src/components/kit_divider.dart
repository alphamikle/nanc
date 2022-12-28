import 'package:flutter/material.dart';

class KitDivider extends StatelessWidget {
  const KitDivider({
    this.width,
    this.height,
    super.key,
  }) : assert(width == null || height == null);

  factory KitDivider.vertical(double height) => KitDivider(height: height);
  factory KitDivider.horizontal(double width) => KitDivider(width: width);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
