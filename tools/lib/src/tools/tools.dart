import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

T cast<T>(dynamic value) {
  return value as T;
}

String toSnackCase(String value) {
  return value.toLowerCase().replaceAll(' ', '_');
}

ValueGetter<Future<T>> delayed<T>(ValueGetter<T> callback) {
  return () async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return callback();
  };
}

String capitalize(String value) => StringUtils.capitalize(StringUtils.camelCaseToLowerUnderscore(value).replaceAll('_', ' '));

String generateEventHash() {
  final List<String> items = 'abcdefghijklmnopqrstuvwxyz1234567890'.split('')..shuffle();
  return items.join();
}
