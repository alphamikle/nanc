import 'package:cms/src/domain/model/ui/component/field_card.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class AddFieldButton extends StatelessWidget {
  const AddFieldButton({
    required this.onPressed,
    this.customHeight,
    super.key,
  });

  static const double size = 40;

  final double? customHeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.all(Radius.circular(kPadding));

    return Container(
      width: size,
      height: customHeight ?? FieldCard.height,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.tertiaryContainer,
        borderRadius: radius,
        border: Border.all(
          color: context.theme.colorScheme.tertiary.o35,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: size - 5,
              height: size - 5,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.tertiary.withOpacity(0.125),
                borderRadius: const BorderRadius.all(Radius.circular(size)),
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
