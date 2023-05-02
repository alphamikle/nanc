import 'package:flutter/material.dart';

import '../../ui_kit.dart';

class KitCenteredText extends StatelessWidget {
  const KitCenteredText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KitText(text: text),
    );
  }
}
