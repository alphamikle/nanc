import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_enum_field.dart';
import '../../logic/fields/enum_field/enum_field.dart';
import '../../logic/fields/enum_field/enum_value.dart';
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
      pageBloc.updateValue(fieldId, value.value);
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
    return BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
      builder: (BuildContext context, BaseDocumentState state) {
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
