import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/bool_field/bool_field.dart';
import '../field_cell_mixin.dart';

class BoolFieldCell extends FieldCellWidget<BoolField> {
  const BoolFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<BoolFieldCell> createState() => _BoolFieldCellState();
}

class _BoolFieldCellState extends State<BoolFieldCell> with FieldCellHelper<BoolField, BoolFieldCell> {
  // ignore: avoid_positional_boolean_parameters
  void onSelect(bool value) => pageBloc.updateValue(fieldId, value);

  @override
  Widget build(BuildContext context) {
    return KitBooleanInput(
      helper: helper,
      value: boolFromJson(pageBloc.valueForKey(fieldId) ?? field.defaultValue),
      onSelect: onSelect,
      isRequired: field.isRequired,
    );
  }
}
