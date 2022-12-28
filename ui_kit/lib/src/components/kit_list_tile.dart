import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

class KitListTile extends StatelessWidget {
  const KitListTile({
    this.child,
    this.title,
    this.isSelected = false,
    super.key,
  }) : assert(child != null || title != null);

  final String? title;
  final Widget? child;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      selected: isSelected,
      selectedTileColor: context.theme.colorScheme.tertiary.filling,
      title: child ?? Text(title!),
    );
  }
}
