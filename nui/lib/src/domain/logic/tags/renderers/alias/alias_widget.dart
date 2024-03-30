import 'package:flutter/material.dart';

class AliasWidget extends StatelessWidget {
  const AliasWidget({
    required this.name,
    required this.child,
    super.key,
  });

  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
