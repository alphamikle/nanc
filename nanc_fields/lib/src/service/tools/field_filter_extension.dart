import '../../domain/fields/logic/field/field.dart';
import '../../domain/type/field_types.dart';

extension FieldFilterExtension on List<Field> {
  List<Field> filterByTypes(Iterable<FieldType> types) {
    return where((Field field) => types.contains(field.type)).toList();
  }
}
