import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/animation/animated_state.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_empty_input.dart';
import '../../logic/fields/field/field.dart';
import '../dynamic_field_cell/dynamic_field_child_panel.dart';

class StructureFieldChild extends StatefulWidget {
  const StructureFieldChild({
    required this.item,
    this.onMoveUp,
    this.onMoveDown,
    this.onDelete,
    this.onEdit,
    super.key,
  });

  final Field item;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  State<StructureFieldChild> createState() => _StructureFieldChildState();
}

class _StructureFieldChildState extends State<StructureFieldChild> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Curve get animationCurve => Curves.easeInQuart;

  @override
  Duration get animationDuration => const Duration(milliseconds: 250);

  @override
  Duration get reverseDuration => const Duration(milliseconds: 500);

  // ignore: avoid_positional_boolean_parameters
  Future<void> onInputHover(bool isActive) async {
    if (isActive) {
      await forward();
    } else {
      await animateBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Field field = widget.item;
    final String type = ' ${capitalize(field.type.name)}';
    String title = field.name;
    if (field.isRequired) {
      title = '$title (required)';
    }

    return SizedBox(
      height: 51,
      child: KitInkWell(
        onPressed: () {},
        borderRadius: BorderRadius.zero,
        onHover: onInputHover,
        noReaction: true,
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child!,
              SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: Gap.regular, right: Gap.small),
                  child: Opacity(
                    opacity: animation.value,
                    child: DynamicFieldChildPanel(
                      onMoveUp: widget.onMoveUp,
                      onMoveDown: widget.onMoveDown,
                      onDelete: widget.onDelete,
                      onEdit: widget.onEdit,
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: Expanded(
            child: KitEmptyInput(
              color: field.description(context).color,
              child: Padding(
                padding: const EdgeInsets.only(left: Gap.large, right: Gap.large),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.regular),
                      child: Center(
                        child: Icon(
                          field.description(context).icon,
                          color: field.description(context).color.withOpacity(1),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    Text(
                      type,
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
