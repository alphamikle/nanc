typedef Json = Map<String, dynamic>;
typedef DJson = Map<dynamic, dynamic>;

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
