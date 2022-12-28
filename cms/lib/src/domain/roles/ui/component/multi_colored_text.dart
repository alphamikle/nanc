import 'package:flutter/material.dart';

class MultiColoredText extends StatelessWidget {
  const MultiColoredText({
    required this.text,
    required this.colors,
    this.style,
    super.key,
  });

  final String text;
  final List<Color> colors;
  final TextStyle? style;

  List<TextSpan> buildChildren() {
    final List<TextSpan> result = [];
    for (int i = 0; i < text.length; i++) {
      final Color currentColor = colors.isEmpty ? Colors.black : colors[i % colors.length];
      final String currentSymbol = text[i];
      final TextStyle style = (this.style ?? const TextStyle()).copyWith(color: currentColor);
      result.add(TextSpan(
        text: currentSymbol,
        style: style,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: buildChildren(),
      ),
    );
  }
}
