import 'package:flutter/material.dart';

class KitBorders extends ThemeExtension<KitBorders> {
  const KitBorders({
    required this.smallRadius,
    required this.middleRadius,
    required this.largeRadius,
    required this.extraRadius,
    required this.circleRadius,
  });

  final BorderRadius smallRadius;
  final BorderRadius middleRadius;
  final BorderRadius largeRadius;
  final BorderRadius extraRadius;
  final BorderRadius circleRadius;

  BorderRadius get inputRadius => smallRadius;

  static KitBorders of(BuildContext context) => Theme.of(context).extension()!;

  @override
  ThemeExtension<KitBorders> copyWith() => this;

  @override
  ThemeExtension<KitBorders> lerp(ThemeExtension<KitBorders>? other, double t) => this;
}

extension KitBordersFromContext on BuildContext {
  KitBorders get kitBorders => KitBorders.of(this);
}
