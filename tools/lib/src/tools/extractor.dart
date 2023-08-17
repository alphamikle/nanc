/// Will accept only [int] or [String]
typedef StringOrInt = Object;

bool _isInt(num number) => number is int || number.toInt() == number;

T? _get<T>(Object? value, List<StringOrInt> keys) {
  if (value == null) {
    return null;
  }
  final List<StringOrInt> newKeys = [...keys];

  if (newKeys.isEmpty) {
    return value as T?;
  }

  final StringOrInt key = newKeys.removeAt(0);
  assert(key is String || (key is num && _isInt(key)));

  if (value is List<dynamic>) {
    assert(key is num && _isInt(key));
    return _get(value[(key as num).toInt()], newKeys);
  } else if (value is Map<dynamic, dynamic>) {
    final dynamic fastResult = value[key];
    if (fastResult != null) {
      return fastResult as T?;
    }
    for (final MapEntry(key: entryKey, value: entryValue) in value.entries) {
      final String stringEntryKey = (entryKey is num && _isInt(entryKey)) ? entryKey.toInt().toString() : entryKey.toString();
      final String stringSearchKey = (key is num && _isInt(key)) ? key.toInt().toString() : key.toString();
      if (stringEntryKey == stringSearchKey) {
        return _get(entryValue, newKeys);
      }
    }
    return null;
  }
  return value as T;
}

extension ExtractableObject on Object? {
  T? get<T>(
    StringOrInt key, [
    StringOrInt? key2,
    StringOrInt? key3,
    StringOrInt? key4,
    StringOrInt? key5,
    StringOrInt? key6,
    StringOrInt? key7,
    StringOrInt? key8,
    StringOrInt? key9,
    StringOrInt? key10,
  ]) {
    assert(key is String || key is int);
    assert(key2 == null || key2 is String || key2 is int);
    assert(key3 == null || key3 is String || key3 is int);
    assert(key4 == null || key4 is String || key4 is int);
    assert(key5 == null || key5 is String || key5 is int);
    assert(key6 == null || key6 is String || key6 is int);
    assert(key7 == null || key7 is String || key7 is int);
    assert(key8 == null || key8 is String || key8 is int);
    assert(key9 == null || key9 is String || key9 is int);
    assert(key10 == null || key10 is String || key10 is int);

    final List<Object?> arguments = [key, key2, key3, key4, key5, key6, key7, key8, key9, key10];
    final List<StringOrInt> typedArguments = arguments.where((Object? element) => element is String || element is num).cast<StringOrInt>().toList();
    return _get<T>(this, typedArguments);
  }
}
