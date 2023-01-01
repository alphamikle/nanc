import 'dart:math';

int randomIntBetween({
  required int min,
  required int max,
}) {
  return Random().nextInt(max - min + 1) + min;
}

List<String> splitTextByLines(String text) {
  final List<String> lines = text.split(RegExp(r'(\r?\n)|(\r?\t)|(\r)'));
  if (lines.last.isEmpty) {
    lines.removeLast();
  }
  return lines;
}
