import 'package:googleapis/firestore/v1.dart';
import 'package:nanc/model.dart';
import 'package:tools/tools.dart';

final RegExp _documentIdRegExp = RegExp(r'.*/(?<id>.*)$');

Value toFirestoreValue(dynamic value, {bool dateAsMs = false}) {
  final Value result = Value();

  /// ? NULL
  if (value == null) {
    result.nullValue = 'NULL_VALUE';
    return result;
  }

  /// ? Only [Uint8List.toList()] will be a such type
  final bool isBinaryValue = value is List<int>;
  if (isBinaryValue) {
    result.bytesValueAsBytes = value;
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

  /// Can be [num], [double], [int] or [BigInt]
  final Object? numericValue = value is num || value is BigInt
      ? value
      : value is String
          ? num.tryParse(value) ?? BigInt.tryParse(value)
          : null;
  final bool isNumeric = numericValue != null;

  /// ? INTEGER
  /// Can be [int] or [BigInt]
  late final Object? intValue;
  if (numericValue is num && numericValue.isInt) {
    intValue = numericValue.toInt();
  } else if (numericValue is BigInt) {
    intValue = numericValue;
  } else {
    intValue = null;
  }
  final bool isInt = intValue != null;
  if (isInt) {
    result.integerValue = intValue.toString();
    return result;
  }

  /// ? DOUBLE
  late final double? doubleValue;
  if (isNumeric && numericValue is num) {
    doubleValue = numericValue.toDouble();
  } else if (isNumeric && numericValue is BigInt) {
    throw Exception('Floating point number became BigInt by some reason: "$value"');
  } else {
    doubleValue = null;
  }
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
    return (int.tryParse(value.integerValue!) ?? BigInt.tryParse(value.integerValue!)) as T;
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
  } else if (value.bytesValue != null) {
    return value.bytesValueAsBytes as T;
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
