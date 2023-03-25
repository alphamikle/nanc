import 'package:flutter/material.dart';

class KitInputDecorations extends ThemeExtension<KitInputDecorations> {
  static KitInputDecorations of(BuildContext context) => Theme.of(context).extension()!;

  InputDecoration noneDecoration(BuildContext context, {String? hint}) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: hint,
    );
  }

  @override
  ThemeExtension<KitInputDecorations> copyWith() => this;

  @override
  ThemeExtension<KitInputDecorations> lerp(ThemeExtension<KitInputDecorations>? other, double t) => this;
}

extension KitInputDecorationsAdditions on BuildContext {
  KitInputDecorations get kitDecorations => KitInputDecorations.of(this);
}
