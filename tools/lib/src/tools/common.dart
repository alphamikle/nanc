import 'dart:math';

int randomIntBetween({
  required int min,
  required int max,
}) {
  return Random().nextInt(max - min + 1) + min;
}

List<String> splitTextByLines(String text) => text.split(RegExp(r'(\r?\n)|(\r?\t)|(\r)'));
