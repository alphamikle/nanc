import 'package:flutter/material.dart';

import '../../../ui_kit/domain/ui/components/kit_inputs/kit_font_input.dart';
import '../../logic/fields/font_field/font_field.dart';
import '../field_cell_mixin.dart';

class FontFieldCell extends FieldCellWidget<FontField> {
  const FontFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<FontFieldCell> createState() => _FontFieldCellState();
}

class _FontFieldCellState extends State<FontFieldCell> with FieldCellHelper<FontField, FontFieldCell> {
  @override
  Widget build(BuildContext context) {
    return KitFontInput(
      controller: controller,
      helper: helper,
      onChanged: (String fontName) => pageBloc.updateValue(fieldId, fontName),
      isChanged: pageBloc.fieldWasChanged(fieldId),
      isRequired: field.isRequired,
    );
  }
}
