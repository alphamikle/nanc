import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../theme/kit_colors.dart';
import 'kit_text.dart';

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
      selectedTileColor: context.theme.colorScheme.tertiary.o075,
      title: child ?? KitText(text: title!),
    );
  }
}
