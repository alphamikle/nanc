import 'package:collection/collection.dart';

bool isTheSame(dynamic value1, dynamic value2) {
  if (value1 == '' && value2 == null) {
    return true;
  }
  if (value1 == null && value2 == '') {
    return true;
  }
  if (value1.runtimeType != value2.runtimeType) {
    return false;
  }
  if (value1 is List || value1 is Map || value1 is Set || value1 is Iterable) {
    return const DeepCollectionEquality().equals(value1, value2);
  }
  return value1 == value2;
}
