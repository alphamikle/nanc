import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/string_field/string_field.dart';
import '../field_cell_mixin.dart';

class StringFieldCell extends FieldCellWidget<StringField> {
  const StringFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<StringFieldCell> createState() => _MultilineTextFieldCellState();
}

class _MultilineTextFieldCellState extends State<StringFieldCell> with FieldCellHelper<StringField, StringFieldCell> {
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
