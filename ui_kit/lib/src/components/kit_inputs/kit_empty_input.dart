import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_segmented_field/kit_segmented_field_ui.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

class KitEmptyInput extends StatelessWidget {
  const KitEmptyInput({
    required this.child,
    this.color,
    super.key,
  });

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    final Color borderColor = KitSegmentedFieldUI.generateBorderColor(
      context: context,
      isChanged: false,
      hasError: false,
      hasFocus: false,
      customColor: color,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color == null ? theme.inputDecorationTheme.fillColor : color!.o075,
        borderRadius: context.kitBorders.inputRadius,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: child,
    );
  }
}
