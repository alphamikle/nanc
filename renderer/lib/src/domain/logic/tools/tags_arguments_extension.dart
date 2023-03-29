extension TagsArgumentsExtension on List<String> {
  String toArgs(String name) {
    return '$name="${join(' | ')}"';
  }
}
