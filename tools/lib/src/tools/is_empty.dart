bool isEmpty(dynamic value) {
  if (value == null) {
    return true;
  } else if (value == '') {
    return true;
  } else if (value is Iterable && value.isEmpty) {
    return true;
  } else if (value is Iterable) {
    final bool isAnyNotEmpty = value.any((dynamic it) => isEmpty(it) == false);
    if (isAnyNotEmpty) {
      return false;
    }
    return true;
  }
  return false;
}
