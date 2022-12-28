import 'package:flutter/material.dart';

class KitNotFoundText extends StatelessWidget {
  const KitNotFoundText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
