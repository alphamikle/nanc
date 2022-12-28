import 'package:fields/src/domain/fields/logic/string_field/string_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MultilineStringFieldCell extends FieldCellWidget<StringField> {
  const MultilineStringFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<MultilineStringFieldCell> createState() => _MultilineTextFieldCellState();
}

class _MultilineTextFieldCellState extends State<MultilineStringFieldCell> with FieldCellHelper<StringField, MultilineStringFieldCell> {
  @override
  Widget build(BuildContext context) {
    return KitTextField(
      placeholder: 'Write here...',
      helper: helper,
      controller: controller,
      onChanged: (String newValue) => pageBloc.updateValue(fieldId, newValue),
      maxLines: field.maxLines,
      isChanged: pageBloc.fieldWasChanged(fieldId),
      isRequired: field.isRequired,
    );
  }
}
