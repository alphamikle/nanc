import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../fields.dart';

enum GroupPosition {
  left,
  middle,
  right,
}

class GroupFieldCell extends FieldCellWidget<GroupField> {
  const GroupFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<GroupFieldCell> createState() => _GroupFieldCellState();
}

class _GroupFieldCellState extends State<GroupFieldCell> with FieldCellHelper<GroupField, GroupFieldCell>, KitFocusStreamMixin<GroupFieldCell> {
  Widget groupedCellBuilder(int index, Field _) {
    final bool isFirst = index == 0;
    final bool isLast = index == field.fields.length - 1;
    GroupPosition? position;
    if (field.fields.length > 1) {
      if (isFirst) {
        position = GroupPosition.left;
      } else if (isLast) {
        position = GroupPosition.right;
      } else {
        position = GroupPosition.middle;
      }
    }
    final Widget fieldCell = FieldMapper.fieldToInput(field: field, creationMode: creationMode);
    return Expanded(child: fieldCell);
  }

  List<Widget> buildGroup() {
    final List<Widget> group = [];
    for (int i = 0; i < field.fields.length; i++) {
      final bool isFirst = i == 0;
      final bool isLast = i == field.fields.length - 1;
      GroupPosition? position;
      if (field.fields.length > 1) {
        if (isFirst) {
          position = GroupPosition.left;
        } else if (isLast) {
          position = GroupPosition.right;
        } else {
          position = GroupPosition.middle;
        }
      }
      final Widget fieldCell = FieldMapper.fieldToInput(field: field, creationMode: creationMode);
      if (position != null) {
        group.add(Expanded(child: fieldCell));
        if (isLast == false) {
          group.add(KitDivider.horizontal(Gap.small));
        }
      } else {
        group.add(Expanded(child: fieldCell));
      }
    }
    return group;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: buildGroup(),
    );
  }
}
