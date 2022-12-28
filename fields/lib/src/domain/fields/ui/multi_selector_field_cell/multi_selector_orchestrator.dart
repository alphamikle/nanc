import 'package:fields/src/domain/fields/logic/multi_selector_field/multi_selector_field.dart';
import 'package:fields/src/domain/fields/ui/multi_selector_field_cell/multi_selector_field_cell_array_of_ids.dart';
import 'package:fields/src/domain/fields/ui/multi_selector_field_cell/multi_selector_field_cell_third_table.dart';
import 'package:flutter/cupertino.dart';

Widget multiSelectorOrchestrator({required MultiSelectorField field, required bool creationMode}) {
  if (field.structure == MultiSelectorFieldStructure.arrayOfIds) {
    return MultiSelectorArrayOfIdsFieldCell(field: field, creationMode: creationMode);
  } else if (field.structure == MultiSelectorFieldStructure.thirdTable) {
    if (field.thirdTable == null) {
      throw Exception('MultiSelectorField must contain non-null "thirdTable" field for structure "thirdTable"');
    }
    return MultiSelectorThirdTableFieldCell(field: field, creationMode: creationMode);
  }
  throw UnimplementedError('Not implemented MultiSelectorType: ${field.toJson()}');
}
