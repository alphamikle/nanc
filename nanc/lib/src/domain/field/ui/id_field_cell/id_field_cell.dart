import 'package:flutter/material.dart';

import '../../../ui_kit/domain/ui/components/kit_inputs/kit_id_input.dart';
import '../../logic/fields/id_field/id_field.dart';
import '../field_cell_mixin.dart';

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
