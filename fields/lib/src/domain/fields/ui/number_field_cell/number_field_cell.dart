import 'package:fields/src/domain/fields/logic/number_field/number_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class NumberFieldCell extends FieldCellWidget<NumberField> {
  const NumberFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<NumberFieldCell> createState() => _NumberFieldCellState();
}

class _NumberFieldCellState extends State<NumberFieldCell> with FieldCellHelper {
  @override
  Widget build(BuildContext context) {
    return KitNumberField(
      controller: controller,
      helper: helper,
      placeholder: '1234.56',
      onChanged: (num? newValue) => pageBloc.updateValue(fieldId, newValue),
      isChanged: pageBloc.fieldWasChanged(fieldId),
      validator: field.validator,
      isRequired: field.isRequired,
    );
  }
}
