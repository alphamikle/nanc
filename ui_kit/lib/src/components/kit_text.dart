import 'package:flutter/material.dart';

class KitText extends StatelessWidget {
  const KitText({
    required this.text,
    this.style,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.textScaleFactor,
    this.softWrap,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final bool? softWrap;

  TextStyle effectiveStyle(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    return (style ?? defaultTextStyle.style).copyWith(height: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: effectiveStyle(context),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      softWrap: softWrap,
    );
  }
}
