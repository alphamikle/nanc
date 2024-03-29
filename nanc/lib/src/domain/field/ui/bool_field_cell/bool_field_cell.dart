import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../ui_kit/domain/ui/components/kit_inputs/kit_boolean_input.dart';
import '../../logic/fields/bool_field/bool_field.dart';
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

  Future<void> preload() async {
    final Object? value = currentValue();
    if (value == null) {
      pageBloc.updateValue(fieldId, field.defaultValue);
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
  }

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
