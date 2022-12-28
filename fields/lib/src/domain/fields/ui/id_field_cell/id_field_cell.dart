import 'package:fields/src/domain/fields/logic/id_field/id_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class IdFieldCell extends FieldCellWidget<IdField> {
  const IdFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<IdFieldCell> createState() => _IdFieldCellState();
}

class _IdFieldCellState extends State<IdFieldCell> with FieldCellHelper<IdField, IdFieldCell> {
  @override
  Widget build(BuildContext context) {
    return KitIdInput(
      controller: controller,
      helper: helper,
      placeholder: 'Type model id here...',
      tooltip: 'Generate a new ID',
      onChanged: (String newValue) => pageBloc.updateValue(fieldId, newValue),
      isRequired: field.isRequired,
      isChanged: pageBloc.fieldWasChanged(fieldId),
    );
  }
}
