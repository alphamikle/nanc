import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../logic/constants/gap.dart';
import '../../theme/kit_colors.dart';
import '../kit_buttons/kit_button.dart';
import '../kit_divider.dart';

class KitBaseModalBottom extends StatelessWidget {
  const KitBaseModalBottom({
    this.onOk,
    this.onCancel,
    this.okText,
    this.cancelText,
    super.key,
  }) : assert(onOk != null || onCancel != null);

  final VoidCallback? onOk;
  final VoidCallback? onCancel;
  final String? okText;
  final String? cancelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onOk != null)
          KitButton(
            text: okText ?? 'Ok',
            onPressed: onOk,
            color: context.kitColors.successColor,
          ),
        if (onOk != null && onCancel != null) KitDivider.horizontal(Gap.large),
        if (onCancel != null)
          KitButton(
            text: cancelText ?? 'Cancel',
            onPressed: onCancel,
            color: context.theme.colorScheme.error,
          ),
      ],
    );
  }
}
