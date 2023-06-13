import 'package:googleapis/firestore/v1.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

final RegExp _documentIdRegExp = RegExp(r'.*/(?<id>.*)$');

Value toFirestoreValue(dynamic value, {bool dateAsMs = false}) {
  final Value result = Value();

  /// ? NULL
  if (value == null) {
    result.nullValue = 'NULL_VALUE';
    return result;
  }

  /// ? BOOLEAN
  final bool? booleanValue = value is bool
      ? value
      : value is String
          ? bool.tryParse(value)
          : null;
  if (booleanValue != null) {
    result.booleanValue = booleanValue;
    return result;
  }

  final num? numericValue = value is num
      ? value
      : value is String
          ? num.tryParse(value)
          : null;
  final bool isNumeric = numericValue != null;

  /// ? INTEGER
  final int? intValue = isNumeric
      ? numericValue.isInt
          ? numericValue.toInt()
          : null
      : null;
  final bool isInt = intValue != null;
  if (isInt) {
    result.integerValue = intValue.toString();
    return result;
  }

  /// ? DOUBLE
  final double? doubleValue = isNumeric
      ? isInt
          ? null
          : numericValue.toDouble()
      : null;
  final bool isDouble = doubleValue != null;
  if (isDouble) {
    result.doubleValue = doubleValue;
    return result;
  }

  /// ? TIMESTAMP
  final DateTime? dateTime = value is DateTime
      ? value
      : value is String
          ? DateTime.tryParse(value)
          : null;
  if (dateTime != null) {
    if (dateAsMs) {
      result.timestampValue = dateTime.microsecondsSinceEpoch.toString();
    } else {
      result.timestampValue = dateTime.toUtc().toIso8601String();
    }
    return result;
  }

  /// ? ARRAY
  if (value is List) {
    final ArrayValue arrayValue = ArrayValue();
    arrayValue.values = [];
    for (final dynamic childValue in value) {
      arrayValue.values!.add(toFirestoreValue(childValue));
    }
    result.arrayValue = arrayValue;
    return result;
  }

  /// ? MAP
  if (value is Map) {
    final MapValue mapValue = MapValue();
    mapValue.fields = {};

    final Iterable<MapEntry> entries = value.entries;
    for (final MapEntry(:dynamic key, :dynamic value) in entries) {
      mapValue.fields![key.toString()] = toFirestoreValue(value);
    }
    result.mapValue = mapValue;
    return result;
  }

  result.stringValue = value.toString();
  return result;
}

T? fromFirestoreValue<T>(Value value) {
  if (value.nullValue != null) {
    return null;
  } else if (value.integerValue != null) {
    return int.parse(value.integerValue!) as T;
  } else if (value.doubleValue != null) {
    return value.doubleValue! as T;
  } else if (value.timestampValue != null) {
    final DateTime? dateFromIso = DateTime.tryParse(value.timestampValue!);
    return (dateFromIso ?? DateTime.fromMicrosecondsSinceEpoch(int.parse(value.timestampValue!))).toIso8601String() as T;
  } else if (value.booleanValue != null) {
    return value.booleanValue! as T;
  } else if (value.stringValue != null) {
    return value.stringValue! as T;
  } else if (value.arrayValue != null) {
    return value.arrayValue!.values!.map(fromFirestoreValue).toList() as T;
  } else if (value.mapValue != null) {
    final DJson result = {};
    final Iterable<MapEntry<String, Value>> entries = value.mapValue!.fields!.entries;
    for (final MapEntry(:String key, :Value value) in entries) {
      result[key] = fromFirestoreValue(value);
    }
    return result as T;
  }
  return null;
}

Json documentToJson(Model model, Document document) {
  final fields = document.fields;
  if (fields == null) {
    return {};
  }
  final Json json = {};
  final Iterable<MapEntry<String, Value>> entries = fields.entries;
  for (final MapEntry(:String key, :Value value) in entries) {
    json[key] = fromFirestoreValue<dynamic>(value);
  }
  final RegExpMatch? match = _documentIdRegExp.firstMatch(document.name ?? '');
  final String? documentId = match?.namedGroup('id');
  final String primaryIdFieldName = model.idField.id;
  if (json.containsKey(primaryIdFieldName) == false) {
    json[primaryIdFieldName] = documentId;
  }
  return json;
}

Document jsonToDocument({required Json json, required String? path, bool dateAsMs = false}) {
  final Map<String, Value> documentFields = {};
  for (final MapEntry(:key, :value) in json.entries) {
    documentFields[key.toString()] = toFirestoreValue(value, dateAsMs: dateAsMs);
  }

  return Document(
    name: path,
    fields: documentFields,
  );
}

extension _IsInt on num {
  bool get isInt {
    if (this is int) {
      return true;
    }
    return truncateToDouble() == toDouble();
  }
}
