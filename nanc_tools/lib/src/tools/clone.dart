import 'dart:convert';

import '../types/types.dart';

// TODO(alphamikle): Make it faster, not by using json logic
Json clone(Json json) {
  return jsonDecode(jsonEncode(json)) as Json;
}

T deepClone<T>(T json) {
  if (json is Json) {
    return _cloneMap(json) as T;
  } else if (json is List<dynamic>) {
    return _cloneList(json) as T;
  }
  return json;
}

Json _cloneMap(Json map) {
  final Json result = {};
  for (final MapEntry(:key, :value) in map.entries) {
    result[key] = deepClone(value);
  }
  return result;
}

List<dynamic> _cloneList(List<dynamic> list) {
  final List<dynamic> result = [];
  for (final dynamic value in result) {
    result.add(deepClone(value));
  }
  return result;
}
