import 'package:nanc_tools/nanc_tools.dart';

String? extractValueAsStringByChain(dynamic object, List<String> keyChain) {
  final dynamic value = extractValueByChain(object, keyChain);
  if (value == null) {
    return null;
  }
  return value.toString();
}

Object? extractValueByChain(Object? object, List<String> keyChain) {
  Object? currentValue = object;
  for (int i = 0; i < keyChain.length; i++) {
    final String piece = keyChain[i];
    final int? pieceIndex = int.tryParse(piece);
    final bool isLast = i == keyChain.length - 1;

    if (currentValue is List) {
      if (pieceIndex != null && pieceIndex < currentValue.length) {
        currentValue = currentValue[pieceIndex];
      } else {
        return null;
      }
    } else if (currentValue is Map) {
      currentValue = currentValue[piece];
    } else if (currentValue == null) {
      return null;
    }
    if (isLast) {
      return currentValue;
    }
  }
  return null;
}

Json updateValueByChain(Json object, Object? value, List<String> keyChain) {
  final Json result = deepClone(object);
  _updateByChain(object: result, value: value, keyChain: [...keyChain], initialObject: result, initialKeyChain: [...keyChain]);
  return result;
}

void _updateByChain({
  required Json object,
  required Object? value,
  required List<String> keyChain,
  required Json initialObject,
  required List<String> initialKeyChain,
}) {
  if (keyChain.isEmpty) {
    return;
  }

  final String key = keyChain.removeAt(0);
  if (keyChain.isEmpty) {
    if (value == null) {
      object.remove(key);
    } else {
      object[key] = value;
    }
  } else {
    if (object.containsKey(key) == false) {
      object[key] = <String, dynamic>{};
    }
    if (object[key] is Map) {
      _updateByChain(object: object[key] as Json, value: value, keyChain: [...keyChain], initialObject: initialObject, initialKeyChain: initialKeyChain);
      if (value == null && object[key] is Map && (object[key] as Map).isEmpty) {
        object.remove(key);
      }
    } else {
      logWarning('Incorrect Map<String, Object?> structure or key;\nKey was: "$initialKeyChain";\nObject was: ${prettyJson(initialObject)}');
    }
  }
}
