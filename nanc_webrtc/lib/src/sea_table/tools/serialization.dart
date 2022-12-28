import 'dart:convert';

import 'package:tools/tools.dart';

final DateTime fallbackCreatedAt = DateTime.parse('1994-05-30T12:00:00.000Z');
const String rowIdField = '_id';

String somethingToString(dynamic value) => jsonEncode(value);

/// [value] can be a [String] or [Map] or [null]
Json jsonFromDynamic(dynamic value) {
  final Json defaultResult = <String, dynamic>{};
  if (value == null || value == '') {
    return defaultResult;
  }
  if (value is Json) {
    return value;
  }
  if (value is String) {
    try {
      return castToJson(jsonDecode(value));
    } catch (error) {
      logg('Deserialization error: jsonFromDynamic = "$value"');
    }
  }
  return defaultResult;
}

/// [value] can be a [String] or [List<Map>] or [null]
List<Json> listOfJsonFromDynamic(dynamic value) {
  if (value == null || value == '') {
    return [];
  }
  if (value is List) {
    return value.map(castToJson).toList();
  }
  if (value is String) {
    try {
      final List<dynamic> result = jsonDecode(value) as List;
      return result.map(castToJson).toList();
    } catch (error) {
      logg('Deserialization error: listOfJsonFromString = "$value"');
    }
  }
  return [];
}
