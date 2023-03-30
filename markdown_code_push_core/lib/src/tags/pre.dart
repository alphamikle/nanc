// ignore_for_file:all

import 'package:flutter/material.dart';
import 'package:highlight/highlight.dart' as hi;
import 'package:markdown/markdown.dart' as m;

import 'package:markdown_code_push_core/src/config/style_config.dart';

///Tag: pre
///the pre widget
class PreWidget extends StatelessWidget {

  const PreWidget({
    super.key,
    required this.node,
  });
  final m.Node node;

  @override
  Widget build(BuildContext context) {
    final preConfig = StyleConfig().preConfig;
    final preWidget = Container(
      decoration: preConfig?.decoration ??
          BoxDecoration(
            color: defaultPreBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
      margin: preConfig?.margin,
      padding: preConfig?.padding ?? const EdgeInsets.fromLTRB(10, 20, 10, 20),
      width: double.infinity,
      child: Text.rich(TextSpan(
        children: highLightSpans(
          node.textContent,
          language: preConfig?.language ?? 'dart',
          autoDetectionLanguage: preConfig?.autoDetectionLanguage ?? false,
          theme: preConfig?.theme ?? defaultHighLightCodeTheme,
          textStyle: preConfig?.textStyle ?? const TextStyle(fontSize: 14),
          tabSize: preConfig?.tabSize ?? 8,
        ),
      )),
    );

    return preConfig?.preWrapper?.call(preWidget, node.textContent) ?? preWidget;
  }
}

///config class for [PreWidget]
class PreConfig {

  PreConfig({
    this.padding,
    this.decoration,
    this.margin,
    this.textStyle,
    this.textAlign,
    this.textDirection,
    this.theme,
    this.language,
    this.tabSize,
    this.preWrapper,
    this.autoDetectionLanguage,
  });
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final PreWrapper? preWrapper;

  ///see package:flutter_highlight/themes/
  final Map<String, TextStyle>? theme;

  final String? language;

  ///set [autoDetectionLanguage] `true` to enable language auto detection, but it will cause performance issue
  ///so it is not recommended
  ///see https://github.com/git-touch/highlight/blob/251505aae568e95ad941e023c110495fa5ad0a16/highlight/lib/src/highlight.dart#L247
  final bool? autoDetectionLanguage;
  final int? tabSize;
}

typedef PreWrapper = Widget Function(Widget preWidget, String text);

List<InlineSpan> highLightSpans(
  String input, {
  String? language,
  bool autoDetectionLanguage = false,
  Map<String, TextStyle>? theme = const {},
  TextStyle? textStyle,
  int tabSize = 8,
}) {
  return _convert(hi.highlight.parse(input, language: autoDetectionLanguage ? null : language, autoDetection: autoDetectionLanguage).nodes!, theme ?? {});
}

List<TextSpan> _convert(List<hi.Node> nodes, Map<String, TextStyle> theme) {
  List<TextSpan> spans = [];
  var currentSpans = spans;
  List<List<TextSpan>> stack = [];

  _traverse(hi.Node node) {
    if (node.value != null) {
      currentSpans.add(node.className == null ? TextSpan(text: node.value) : TextSpan(text: node.value, style: theme[node.className!]));
    } else if (node.children != null) {
      List<TextSpan> tmp = [];
      currentSpans.add(TextSpan(children: tmp, style: theme[node.className!]));
      stack.add(currentSpans);
      currentSpans = tmp;

      for (final n in node.children!) {
        _traverse(n);
        if (n == node.children!.last) {
          currentSpans = stack.isEmpty ? spans : stack.removeLast();
        }
      }
    }
  }

  for (final node in nodes) {
    _traverse(node);
  }
  return spans;
}
