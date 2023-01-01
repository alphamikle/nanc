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
  const TagArgument(this.name, this.values);

  final String name;
  final Set<String> values;
}

class TagProperty {
  const TagProperty({
    required this.name,
    required this.arguments,
    required this.properties,
  });

  final String name;
  final List<TagArgument> arguments;
  final List<TagProperty> properties;
}
