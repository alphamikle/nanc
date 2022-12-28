import 'package:fields/src/domain/fields/logic/dynamic_field/dynamic_field_item.dart';
import 'package:fields/src/domain/fields/ui/dynamic_field_cell/dynamic_field_child_panel.dart';
import 'package:fields/src/domain/mapper/field_mapper.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class DynamicFieldChild extends StatefulWidget {
  const DynamicFieldChild({
    required this.item,
    required this.creationMode,
    required this.deepLevel,
    required this.onChangeChildStructure,
    required this.initialChildrenData,
    required this.editMode,
    this.onMoveUp,
    this.onMoveDown,
    this.onDelete,
    this.onEdit,
    super.key,
  });

  final DynamicFieldItem item;
  final bool creationMode;
  final int deepLevel;
  final ValueChanged<List<DynamicFieldItem>>? onChangeChildStructure;
  final List<DynamicFieldItem>? initialChildrenData;
  final bool editMode;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  State<DynamicFieldChild> createState() => _DynamicFieldChildState();
}

class _DynamicFieldChildState extends State<DynamicFieldChild> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Curve get animationCurve => Curves.easeInQuart;

  @override
  Duration get animationDuration => const Duration(milliseconds: 250);

  @override
  Duration get reverseDuration => const Duration(milliseconds: 500);

  // ignore: avoid_positional_boolean_parameters
  Future<void> onInputHover(bool isActive) async {
    if (widget.editMode == false) {
      return;
    }
    if (isActive) {
      await forward();
    } else {
      await animateBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return KitInkWell(
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
          child: FieldMapper.fieldToInput(
            field: widget.item.field,
            creationMode: widget.creationMode,
            deepLevel: widget.deepLevel,
            onChangeChildStructure: widget.onChangeChildStructure,
            initialChildrenData: widget.initialChildrenData,
          ),
        ),
      ),
    );
  }
}
