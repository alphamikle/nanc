import 'package:flutter/material.dart';

class KitColors extends ThemeExtension<KitColors> {
  const KitColors({
    required this.successColor,
    required this.deleteFieldColor,
    required this.editFieldColor,
  });

  final Color successColor;
  final Color deleteFieldColor;
  final Color editFieldColor;

  static KitColors of(BuildContext context) => Theme.of(context).extension()!;

  @override
  ThemeExtension<KitColors> lerp(ThemeExtension<KitColors>? other, double t) => this;

  @override
  ThemeExtension<KitColors> copyWith() => this;
}

extension KitColorsAdditions on Color {
  Color get filling {
    return withOpacity(0.075);
  }

  Color get shadow {
    return withOpacity(0.15);
  }

  Color get splash {
    return withOpacity(0.25);
  }

  Color get border {
    return withOpacity(0.35);
  }

  Color get translucent {
    return withOpacity(0.5);
  }
}

extension KitColorsFromContext on BuildContext {
  KitColors get kitColors => KitColors.of(this);
}
