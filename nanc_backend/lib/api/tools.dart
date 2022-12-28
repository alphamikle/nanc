import 'dart:math';

Future<void> networkDelay() async {
  const int min = 200;
  const int max = 400;

  final Duration delay = Duration(milliseconds: Random().nextInt(max - min) + min);
  await Future<void>.delayed(delay);
}
