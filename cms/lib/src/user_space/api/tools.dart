import 'dart:math';

import 'package:tools/tools.dart';

Future<void> networkDelay() async {
  const int min = 300;
  const int max = 600;

  final Duration delay = Duration(milliseconds: Random().nextInt(max - min) + min);
  await wait(duration: delay);
}
