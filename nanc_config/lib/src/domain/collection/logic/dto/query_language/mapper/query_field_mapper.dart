import 'package:nanc_config/src/domain/collection/logic/dto/query_language/fields/query_field.dart';
import 'package:nanc_config/src/domain/collection/logic/dto/query_language/fields/query_or_field.dart';
import 'package:tools/tools.dart';

import '../fields/query_and_field.dart';
import '../fields/query_value_field.dart';

Json queryFieldToJson(QueryField field) {
  if (field is QueryOrField) {
    return field.toJson();
  } else if (field is QueryAndField) {
    return field.toJson();
  } else if (field is QueryValueField) {
    return field.toJson();
  }
  throw UnimplementedError('Not found "fieldToJson" implementation for the query field with type "${field.type}"');
}

QueryField queryFieldFromJson(dynamic json) {
  final String? type = json[QueryField.typeKey];
  if (type == null) {
    throw Exception('Incorrect field json representation: $json');
  }
  if (type == QueryFieldType.or.name) {
    return QueryOrField.fromJson(json);
  } else if (type == QueryFieldType.and.name) {
    return QueryAndField.fromJson(json);
  }
  return QueryValueField.fromJson(json);
}

List<QueryField> queryFieldsFromJson(dynamic json) {
  if (json is List<dynamic>) {
    return json.map(queryFieldFromJson).toList();
  }
  return [];
}

List<Json> queryFieldsToJson(List<QueryField> fields) {
  return fields.map(queryFieldToJson).toList();
}
