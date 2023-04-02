String regExpString() {
  final List<String> regExpParts = [
    r'\$(?<main>\w+)',
    r'\.?',
  ];
  for (int i = 1; i < 100; i++) {
    regExpParts.add('(?<part$i>\\w+)\\.');
  }

  return regExpParts.join();
}

final RegExp dataContextMatcher = RegExp(regExpString(), multiLine: true);

Iterable<RegExpMatch> getDataContextMatches(String expression) {
  return dataContextMatcher.allMatches(expression);
}
