import 'package:fields/src/domain/fields/logic/font_field/font_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

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
      placeholder: 'Type font name...',
      onChanged: (String fontName) => pageBloc.updateValue(fieldId, fontName),
      isChanged: pageBloc.fieldWasChanged(fieldId),
      isRequired: field.isRequired,
    );
  }
}
