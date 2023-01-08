import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_ink_well.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_segmented_field/kit_segmented_field.dart';
import 'package:ui_kit/src/constants/gap.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

class KitBooleanInput extends StatefulWidget {
  const KitBooleanInput({
    required this.helper,
    this.isRequired = false,
    this.value = false,
    this.onSelect,
    super.key,
  });

  final String helper;
  final bool isRequired;
  final bool value;
  final ValueChanged<bool>? onSelect;

  @override
  State<KitBooleanInput> createState() => _KitBooleanInputState();
}

class _KitBooleanInputState extends State<KitBooleanInput> {
  late final TextEditingController controller = TextEditingController(text: value.toString());
  late bool value = widget.value;

  // ignore: avoid_positional_boolean_parameters
  void makeChoice(bool result) {
    controller.text = result.toString();
    if (widget.onSelect != null) {
      widget.onSelect!(result);
    }
  }

  @override
  void didUpdateWidget(KitBooleanInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget && widget.value != value) {
      value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return KitSegmentedField(
      controller: controller,
      helper: widget.helper,
      children: [
        _BooleanFieldSegment(
          value: true,
          isSelected: value == true,
          isLeft: true,
          onPressed: () => makeChoice(true),
        ),
        _BooleanFieldSegment(
          value: false,
          isSelected: value == false,
          isLeft: false,
          onPressed: () => makeChoice(false),
        )
      ],
    );
  }
}

class _BooleanFieldSegment extends StatelessWidget {
  const _BooleanFieldSegment({
    required this.value,
    required this.isSelected,
    required this.isLeft,
    this.onPressed,
  });

  final bool value;
  final bool isSelected;
  final bool isLeft;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final double defaultRadiusValue = context.kitBorders.inputRadius.topLeft.x;

    final BorderRadius defaultRadius = BorderRadius.circular(defaultRadiusValue - 1);
    final BorderRadius effectiveRadius = BorderRadius.only(
      topLeft: isLeft ? defaultRadius.topLeft : Radius.zero,
      topRight: isLeft ? Radius.zero : defaultRadius.topRight,
      bottomRight: isLeft ? Radius.zero : defaultRadius.bottomRight,
      bottomLeft: isLeft ? defaultRadius.bottomLeft : Radius.zero,
    );
    final Color iconColor = value ? context.kitColors.successColor : context.theme.colorScheme.error;

    return Theme(
      data: context.theme.copyWith(
        splashColor: iconColor.splash,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? iconColor.shadow : null,
          borderRadius: defaultRadius,
        ),
        child: KitInkWell(
          borderRadius: effectiveRadius,
          onPressed: onPressed,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: Gap.regular),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: Gap.regular),
                    child: isSelected
                        ? Icon(
                            IconPack.mdi_checkbox_blank_circle,
                            color: iconColor,
                          )
                        : Icon(
                            IconPack.mdi_checkbox_blank_circle_outline,
                            color: iconColor,
                          ),
                  ),
                  Text(value ? 'True' : 'False'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
