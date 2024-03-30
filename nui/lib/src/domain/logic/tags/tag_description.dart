class TagDescription {
  const TagDescription({
    required this.description,
    required this.arguments,
    required this.properties,
    this.aliases = const [],
  });

  const TagDescription.empty()
      : description = '',
        arguments = const [],
        properties = const [],
        aliases = const [];

  final String description;
  final List<TagArgument> arguments;
  final List<TagProperty> properties;
  final List<TagAlias> aliases;
}

class TagArgument {
  const TagArgument({required this.name, required this.values, this.description = ''});

  final String name;
  final Set<String> values;
  final String description;
}

class TagAlias {
  const TagAlias({
    required this.name,
    this.values = const {'Widget'},
    this.description = '',
    this.multiple = false,
  });

  final String name;
  final Set<String> values;
  final String description;
  final bool multiple;
}

class TagProperty {
  const TagProperty({
    required this.name,
    required this.arguments,
    required this.properties,
    this.aliases = const [],
    this.description = '',
  });

  final String name;
  final String description;
  final List<TagArgument> arguments;
  final List<TagProperty> properties;
  final List<TagAlias> aliases;
  bool get withChildren => properties.isNotEmpty;
}
