import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import '../../../ui_kit/domain/ui/animation/animated_state.dart';
import '../../../ui_kit/domain/ui/components/kit_divider.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_empty_input.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../logic/fields/dynamic_field/dynamic_field_item.dart';
import '../../logic/fields/field/field.dart';
import '../../logic/mapper/field_mapper.dart';
import '../../logic/mapper/is_single_line_field_extension.dart';
import '../dynamic_field_cell/dynamic_field_child_panel.dart';
import 'structured_field_item.dart';

class StructuredFieldChild extends StatefulWidget {
  const StructuredFieldChild({
    required this.item,
    required this.creationMode,
    required this.deepLevel,
    required this.initialChildrenData,
    required this.editMode,
    required this.singleObject,
    this.onChildChange,
    this.onMoveUp,
    this.onMoveDown,
    this.onDelete,
    super.key,
  });

  final StructuredFieldItem item;
  final bool creationMode;
  final int deepLevel;
  final StructuredFieldItem? initialChildrenData;
  final ValueChanged<List<StructuredFieldItem>>? onChildChange;
  final bool editMode;
  final bool singleObject;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;
  final VoidCallback? onDelete;

  @override
  State<StructuredFieldChild> createState() => _StructuredFieldChildState();
}

class _StructuredFieldChildState extends State<StructuredFieldChild> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Curve get animationCurve => Curves.easeInQuart;
  bool get singleObject => widget.singleObject;

  @override
  Duration get animationDuration => const Duration(milliseconds: 250);

  @override
  Duration get reverseDuration => const Duration(milliseconds: 500);

  List<Field> get fields => widget.item.items.map((DynamicFieldItem it) => it.field).toList();
  late final List<List<Field>> singleLineFieldsRows = _createSingleLineFieldsRows();
  late final List<List<Field>> multiLineFieldsRows = _createMultiLineFieldsRows();
  late int rowsCount = singleLineFieldsRows.length + multiLineFieldsRows.length;

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

  Widget fieldRowBuilder(BuildContext context, int index) {
    final bool isLastRow = index == rowsCount - 1;
    late final List<Field> fieldsRow;
    if (index < singleLineFieldsRows.length) {
      fieldsRow = singleLineFieldsRows[index];
    } else {
      fieldsRow = multiLineFieldsRows[index - singleLineFieldsRows.length];
    }
    final List<Widget> children = [];

    for (int i = 0; i < fieldsRow.length; i++) {
      final bool isLast = i == fieldsRow.length - 1;
      final Field field = fieldsRow[i];
      final Widget fieldCell = FieldMapper.fieldToInput(
        field: field,
        creationMode: widget.creationMode,
        onChildChange: widget.onChildChange,
        deepLevel: widget.deepLevel,
      );
      if (isLast && i == 0) {
        return Padding(
          padding: EdgeInsets.only(bottom: isLastRow ? 0 : Gap.regular),
          child: fieldCell,
        );
      }
      children.add(
        Expanded(
          child: fieldCell,
        ),
      );
      if (isLast == false) {
        children.add(KitDivider.horizontal(Gap.large));
      }
    }
    return Padding(
      padding: EdgeInsets.only(bottom: isLastRow ? 0 : Gap.regular),
      child: Row(
        children: children,
      ),
    );
  }

  List<List<Field>> _createSingleLineFieldsRows() {
    final List<Field> singleLineFields = fields.where((Field it) => it.isSingleLine).toList();
    final int length = singleLineFields.length;
    final List<List<Field>> singleLineFieldsRows = [];
    List<Field> tempRow = [];
    for (int i = 0; i < singleLineFields.length; i++) {
      final bool isLast = i == length - 1;
      final Field field = singleLineFields[i];
      if (length <= 3) {
        tempRow.add(field);
        if (isLast) {
          singleLineFieldsRows.add(tempRow);
        }
      } else if (length == 4) {
        tempRow.add(field);
        if (i.isOdd) {
          singleLineFieldsRows.add(tempRow);
          tempRow = [];
        }
      } else {
        tempRow.add(field);
        if ((i % 3 == 2) || isLast) {
          singleLineFieldsRows.add(tempRow);
          tempRow = [];
        }
      }
    }
    return singleLineFieldsRows;
  }

  List<List<Field>> _createMultiLineFieldsRows() {
    final List<Field> multiLineFields = fields.where((Field it) => it.isSingleLine == false).toList();
    return multiLineFields.map((Field field) => [field]).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Widget childFields = SuperListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: fieldRowBuilder,
      itemCount: rowsCount,
      shrinkWrap: true,
    );

    return KitInkWell(
      onPressed: () {},
      borderRadius: BorderRadius.zero,
      onHover: onInputHover,
      noReaction: true,
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child!,
              SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: singleObject ? Gap.small : Gap.regular, right: Gap.small),
                  child: Opacity(
                    opacity: animation.value,
                    child: DynamicFieldChildPanel(
                      onMoveUp: widget.onMoveUp,
                      onMoveDown: widget.onMoveDown,
                      onDelete: widget.onDelete,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        child: Expanded(
          child: singleObject
              ? childFields
              : KitEmptyInput(
                  child: Padding(
                    padding: const EdgeInsets.all(Gap.regular),
                    child: childFields,
                  ),
                ),
        ),
      ),
    );
  }
}
