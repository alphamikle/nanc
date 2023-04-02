import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class KitBaseModalBottom extends StatelessWidget {
  const KitBaseModalBottom({
    required this.onOk,
    required this.onCancel,
    this.okText,
    this.cancelText,
    super.key,
  });

  final VoidCallback onOk;
  final VoidCallback onCancel;
  final String? okText;
  final String? cancelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        KitButton(
          text: okText ?? 'Ok',
          onPressed: onOk,
          color: context.kitColors.successColor,
        ),
        KitDivider.horizontal(Gap.large),
        KitButton(
          text: cancelText ?? 'Cancel',
          onPressed: onCancel,
          color: context.theme.colorScheme.error,
        ),
      ],
    );
  }
}
