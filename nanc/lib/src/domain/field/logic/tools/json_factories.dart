import 'package:nanc_tools/nanc_tools.dart';

import '../fields/field/field.dart';
import '../mapper/field_mapper.dart';

List<List<Field>> fieldsFromJson(List<dynamic> value) {
  final List<List<Field>> fields = [];
  for (final dynamic fieldJsonRow in value) {
    if (fieldJsonRow is List) {
      fields.add(fieldsFromJsonRow(fieldJsonRow));
    } else {
      throw Exception('Incorrect type of fields');
    }
  }
  return fields;
}

List<Field> fieldsFromJsonRow(List<dynamic> row) {
  final List<Field> fields = [];
  for (final dynamic field in row) {
    fields.add(FieldMapper.jsonToField(castToJson(field)));
  }
  return fields;
}

List<List<Json>> fieldsToJson(List<List<Field>> fields) {
  final List<List<Json>> json = [];
  for (final List<Field> fieldsRow in fields) {
    json.add(fieldsToJsonRow(fieldsRow));
  }
  return json;
}

List<Json> fieldsToJsonRow(List<Field> fields) {
  final List<Json> json = [];
  for (final Field field in fields) {
    json.add(FieldMapper.fieldToJson(field));
  }
  return json;
}
