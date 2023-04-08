import 'package:flutter/material.dart';

typedef Tag = String;
typedef ChildFallbackBuilder = Widget Function(List<Widget> children);
typedef Json = Map<String, dynamic>;
typedef Diff = Map<String, bool>;
typedef TextControllerMap = Map<String, TextEditingController>;
typedef RootKey = GlobalKey<NavigatorState>;
typedef PatternMap = Map<String, TextStyle>;
typedef DJson = Map<dynamic, dynamic>;
typedef CastingFallback<T> = T Function(dynamic json);

Json castToJson(dynamic json) {
  if (json is DJson) {
    final Map<String, dynamic> result = <String, dynamic>{};
    for (final MapEntry<dynamic, dynamic> entry in json.entries) {
      if (entry.key is! String) {
        throw Exception('${entry.key} is not String and ${json.runtimeType} is not a Map<String, dynamic>');
      }
      final String key = entry.key as String;
      final dynamic value = entry.value;
      if (value is List<DJson>) {
        result[key] = value.map(castToJson).toList();
      } else if (value is DJson) {
        result[key] = castToJson(value);
      } else {
        result[key] = value;
      }
    }
    return result;
  }
  throw Exception('${json.runtimeType} is not a Map<dynamic, dynamic>');
}

T castToJsonOr<T>(dynamic json, CastingFallback<T> fallback) {
  try {
    return castToJson(json) as T;
  } catch (error) {
    return fallback(json);
  }
}
