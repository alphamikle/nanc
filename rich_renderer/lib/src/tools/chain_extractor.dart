String? extractValueAsStringByChain(dynamic object, List<String> keyChain) {
  final dynamic value = extractValueByChain(object, keyChain);
  if (value == null) {
    return null;
  }
  return value.toString();
}

dynamic extractValueByChain(dynamic object, List<String> keyChain) {
  dynamic currentValue = object;
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
