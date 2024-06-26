import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../theme/kit_borders.dart';
import '../../theme/kit_colors.dart';
import 'kit_segmented_field/kit_segmented_field_ui.dart';

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
