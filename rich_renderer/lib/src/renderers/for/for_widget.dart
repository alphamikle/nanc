import 'package:flutter/material.dart';

class ForWidget extends StatelessWidget {
  const ForWidget({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
