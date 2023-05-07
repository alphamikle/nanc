import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/enum_field/enum_field.dart';
import '../../logic/enum_field/enum_value.dart';
import '../field_cell_mixin.dart';

class EnumFieldCell extends FieldCellWidget<EnumField> {
  const EnumFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<EnumFieldCell> createState() => _EnumFieldCellState();
}

class _EnumFieldCellState extends State<EnumFieldCell> with FieldCellHelper<EnumField, EnumFieldCell> {
  void preload() {
    final EnumValue? selectedValue = findSelected();
    if (selectedValue != null) {
      controller.text = selectedValue.title;
    }
  }

  List<EnumValue> finder(String value) {
    return field.values;
  }

  void onSelect(EnumValue? value) {
    if (value != null && pageBloc.valueForKey(fieldId) != value.value) {
      pageBloc.updateValue(fieldId, value);
      controller.text = value.title;
    }
  }

  EnumValue? findSelected() {
    final Object? value = pageBloc.valueForKey(fieldId);
    if (value == null) {
      return null;
    }
    return field.values.firstWhereOrNull((EnumValue enumValue) => enumValue.value == value);
  }

  @override
  void initState() {
    super.initState();
    preload();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePageBloc, BaseEntityPageState>(
      builder: (BuildContext context, BaseEntityPageState state) {
        return KitEnumField(
          controller: controller,
          selected: findSelected(),
          values: field.values,
          onSelect: onSelect,
          helper: helper,
          placeholder: 'Select value...',
          isChanged: pageBloc.fieldWasChanged(fieldId),
          isRequired: field.isRequired,
        );
      },
    );
  }
}
