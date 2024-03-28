import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/fields/color_field/color_field.dart';
import '../field_cell_mixin.dart';

class ColorFieldCell extends FieldCellWidget<ColorField> {
  const ColorFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<ColorFieldCell> createState() => _ColorFieldCellState();
}

class _ColorFieldCellState extends State<ColorFieldCell> with FieldCellHelper<ColorField, ColorFieldCell> {
  void onChanged(String value) => pageBloc.updateValue(fieldId, value);

  @override
  Widget build(BuildContext context) {
    return KitColorInput(
      controller: controller,
      onChanged: onChanged,
      helper: helper,
      placeholder: '#FFAABBCC',
      isChanged: pageBloc.fieldWasChanged(fieldId),
      isRequired: field.isRequired,
    );
  }
}
