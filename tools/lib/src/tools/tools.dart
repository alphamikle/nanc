import 'dart:async';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import '../../tools.dart';

typedef Action<T> = FutureOr<T> Function();
typedef Condition = FutureOr<bool> Function();

T cast<T>(dynamic value) {
  return value as T;
}

String toSnackCase(String value) {
  return value.toLowerCase().replaceAll(' ', '_');
}

ValueGetter<Future<T>> delayed<T>(ValueGetter<T> callback) {
  return () async {
    await wait(duration: const Duration(milliseconds: 250));
    return callback();
  };
}

String capitalize(String value) => StringUtils.capitalize(StringUtils.camelCaseToLowerUnderscore(value).replaceAll('_', ' '));

String generateEventHash() {
  final List<String> items = 'abcdefghijklmnopqrstuvwxyz1234567890'.split('')..shuffle();
  return items.join();
}

Future<T?> doSomethingWhen<T>({required Action<T> action, required Condition condition, required Duration interval, int maxTries = 100}) async {
  bool conditionResult = await condition();
  if (conditionResult) {
    return action();
  }
  while (conditionResult == false && maxTries > 0) {
    await wait(duration: interval);
    conditionResult = await condition();
    if (conditionResult) {
      return action();
    }
    maxTries--;
  }
  return null;
}
