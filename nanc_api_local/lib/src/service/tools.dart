import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:nanc_tools/nanc_tools.dart';

FutureOr<void> networkDelay() {
  if (kIsWeb) {
    return null;
  }

  const int min = 50;
  const int max = 100;

  final Duration delay = Duration(milliseconds: Random().nextInt(max - min) + min);
  return wait(duration: delay);
}
