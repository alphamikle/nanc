import 'package:cms/src/domain/model/ui/component/field_card.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class AddFieldButton extends StatelessWidget {
  const AddFieldButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.all(Radius.circular(kPadding));

    return Container(
      width: 60,
      height: FieldCard.height,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.tertiaryContainer,
        borderRadius: radius,
        border: Border.all(
          color: context.theme.colorScheme.tertiary.border,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.tertiary.withOpacity(0.125),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                IconPack.flu_add_circle_filled,
                color: context.theme.colorScheme.tertiary,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onPressed,
                borderRadius: radius,
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
