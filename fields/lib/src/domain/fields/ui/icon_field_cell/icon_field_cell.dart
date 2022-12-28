import 'package:fields/src/domain/fields/logic/icon_field/icon_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class IconFieldCell extends FieldCellWidget<IconField> {
  const IconFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<IconFieldCell> createState() => _IconFieldCellState();
}

class _IconFieldCellState extends State<IconFieldCell> with FieldCellHelper<IconField, IconFieldCell> {
  @override
  Widget build(BuildContext context) {
    return KitIconInput(
      controller: controller,
      helper: helper,
      placeholder: 'Type icon name...',
      onChanged: (String iconName) => pageBloc.updateValue(fieldId, iconName),
      isChanged: pageBloc.fieldWasChanged(fieldId),
      isRequired: field.isRequired,
    );
  }
}
