import 'package:fields/fields.dart';
import 'package:fields/src/domain/fields/ui/multi_selector_field_cell/multi_selector_field_cell_array_of_objects.dart';

FieldCell<MultiSelectorField> multiSelectorOrchestrator({required MultiSelectorField field, required bool creationMode}) {
  if (field.structure == MultiSelectorFieldStructure.arrayOfIds) {
    return MultiSelectorArrayOfIdsFieldCell(field: field, creationMode: creationMode);
  } else if (field.structure == MultiSelectorFieldStructure.arrayOfObjects) {
    return MultiSelectorArrayOfObjectsFieldCell(field: field, creationMode: creationMode);
  } else if (field.structure == MultiSelectorFieldStructure.thirdTable) {
    if (field.thirdTable == null) {
      throw Exception('MultiSelectorField must contain non-null "thirdTable" field for structure "thirdTable"');
    }
    return MultiSelectorThirdTableFieldCell(field: field, creationMode: creationMode);
  }
  throw UnimplementedError('Not implemented MultiSelectorType: ${field.toJson()}');
}
