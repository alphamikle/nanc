import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;
import 'package:markdown_code_push_core/src/config/style_config.dart';
import 'package:markdown_code_push_core/src/tags/p.dart';

///Tag: a
InlineSpan getLinkSpan(m.Element element) => _getLinkTextSpan(element);

///the link textSpan
TextSpan _getLinkTextSpan(m.Element node) {
  final PConfig? pConfig = StyleConfig().pConfig;
  final url = node.attributes['href'];
  final style = pConfig?.linkStyle ?? defaultLinkStyle;
  return TextSpan(
    text: node.textContent,
    recognizer: TapGestureRecognizer()..onTap = () => pConfig?.onLinkTap?.call(url),
    style: style,
  );
}
