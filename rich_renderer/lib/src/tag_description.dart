class TagDescription {
  const TagDescription({
    required this.description,
    required this.arguments,
    required this.properties,
  });

  final String description;
  final List<TagArgument> arguments;
  final List<TagProperty> properties;
}

class TagArgument {
  const TagArgument(this.name, this.values, [this.description = '']);

  final String name;
  final Set<String> values;
  final String description;
}

class TagProperty {
  const TagProperty({
    required this.name,
    required this.arguments,
    required this.properties,
    this.description = '',
  });

  final String name;
  final String description;
  final List<TagArgument> arguments;
  final List<TagProperty> properties;
  bool get withChildren => properties.isNotEmpty;
}
