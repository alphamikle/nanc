import 'package:flutter/material.dart';

class KitColors extends ThemeExtension<KitColors> {
  const KitColors({
    required this.successColor,
    required this.deleteFieldColor,
    required this.editFieldColor,
    required this.warning,
  });

  final Color successColor;
  final Color deleteFieldColor;
  final Color editFieldColor;
  final Color warning;

  static KitColors of(BuildContext context) => Theme.of(context).extension()!;

  @override
  ThemeExtension<KitColors> lerp(ThemeExtension<KitColors>? other, double t) => this;

  @override
  ThemeExtension<KitColors> copyWith() => this;
}

extension KitColorsTransparencies on Color {
  /// Equals to [Color.withOpacity] with (0.075)
  Color get filling {
    return withOpacity(0.075);
  }

  /// Equals to [Color.withOpacity] with (0.15)
  Color get shadow {
    return withOpacity(0.15);
  }

  /// Equals to [Color.withOpacity] with (0.25)
  Color get splash {
    return withOpacity(0.25);
  }

  /// Equals to [Color.withOpacity] with (0.35)
  Color get border {
    return withOpacity(0.35);
  }

  /// Equals to [Color.withOpacity] with (0.5)
  Color get translucent {
    return withOpacity(0.5);
  }
}

extension KitColorsFromContext on BuildContext {
  KitColors get kitColors => KitColors.of(this);
}
