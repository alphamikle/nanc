library query_language;

import 'package:tools/tools.dart';

import '../fields/query_field.dart';

Json? queryFieldToJson(QueryField? field) {
  if (field is QueryOrField) {
    return field.toJson();
  } else if (field is QueryAndField) {
    return field.toJson();
  } else if (field is QueryValueField) {
    return field.toJson();
  }
  return null;
}

QueryField? queryFieldFromJson(dynamic json) {
  final String? type = json[QueryField.typeKey];
  if (type == null) {
    return null;
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
    return json.map(queryFieldFromJson).whereType<QueryField>().toList();
  }
  return [];
}

List<Json> queryFieldsToJson(List<QueryField> fields) {
  return fields.map(queryFieldToJson).whereType<Json>().toList();
}

/*
{
 "condition_wrapper": {
  "type": "or",
  "fields": [
   {
    "value_wrapper": {
     "field_id": "first_name",
     "type": "notStartsWith",
     "value": "Alex"
    }
   },
   {
    "condition_wrapper": {
     "type": "or",
     "fields": [
      {
       "value_wrapper": {
        "field_id": "last_name",
        "type": "contains",
        "value": "Alfa"
       }
      },
      {
       "value_wrapper": {
        "field_id": "last_name",
        "type": "contains",
        "value": "Beta1"
       }
      }
     ]
    }
   }
  ]
 }
}
 */
Json mapQueryFieldCellJsonToQueryFieldJson(dynamic rawFieldCellJson) {
  final Json fieldCellJson = castToJson(rawFieldCellJson);
  final bool isConditionField = fieldCellJson[QueryConditionField.conditionWrapperKey] != null;
  final bool isValueField = fieldCellJson[QueryValueField.valueWrapperKey] != null;
  if (isConditionField) {
    final Json conditionFieldJson = castToJson(fieldCellJson[QueryConditionField.conditionWrapperKey]);

    return <String, dynamic>{
      QueryField.typeKey: conditionFieldJson[QueryField.typeKey],
      QueryConditionField.fieldsKey: ((conditionFieldJson[QueryConditionField.fieldsKey] ?? <dynamic>[]) as List<dynamic>)
          .map(
            mapQueryFieldCellJsonToQueryFieldJson,
          )
          .toList(),
    };
  } else if (isValueField) {
    return castToJson(fieldCellJson[QueryValueField.valueWrapperKey]);
  }
  return {};
}
