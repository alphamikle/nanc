class Property {
  factory Property(String name) => Property._(name, haveChildren: false);

  factory Property.withChildren(String name) => Property._(name, haveChildren: true);

  const Property._(
    this.name, {
    required this.haveChildren,
  });

  final String name;
  final bool haveChildren;
}
