import '../fields/field/field.dart';
import '../type/field_types.dart';

extension FieldFilterExtension on List<Field> {
  List<Field> filterByTypes(Iterable<FieldType> types) {
    return where((Field field) => types.contains(field.type)).toList();
  }
}
