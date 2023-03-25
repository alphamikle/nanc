import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class StringFieldCell extends FieldCellWidget<StringField> {
  const StringFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  }) : groupPosition = null;

  const StringFieldCell._toFlatCell({
    required super.field,
    required super.creationMode,
    required this.groupPosition,
  });

  @override
  final GroupPosition? groupPosition;

  @override
  FieldCell<StringField> toGroupedCell(GroupPosition position) => StringFieldCell._toFlatCell(
        field: field,
        creationMode: creationMode,
        groupPosition: position,
      );

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
