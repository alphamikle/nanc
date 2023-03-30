import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'package:markdown_code_push_core/src/config/style_config.dart';
import 'package:markdown_code_push_core/src/tags/common.dart';

///Tag:  code
InlineSpan getCodeSpan(m.Element node) => _getCodeTextSpan(node);

///the code textSpan
TextSpan _getCodeTextSpan(m.Element node) {
  final config = StyleConfig().codeConfig;
  final style = config?.codeStyle ?? defaultCodeStyle;
  return TextSpan(style: style, children: buildSpans(node, style));
}

class CodeConfig {

  CodeConfig({this.codeStyle});
  final TextStyle? codeStyle;
}
