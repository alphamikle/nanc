import 'package:flutter/material.dart';

class PropertyWidget<T> extends StatelessWidget {
  const PropertyWidget({
    required this.name,
    required this.property,
    super.key,
  });

  final String name;
  final T? property;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
