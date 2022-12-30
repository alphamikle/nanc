import 'package:flutter/material.dart';
import 'package:rich_renderer/src/types/types.dart';

/// ? Entity, which configures an any custom tag rendering logic
class TagRenderer {
  const TagRenderer({
    required this.icon,
    required this.tag,
    required this.pattern,
    required this.endPattern,
    required this.example,
    required this.builder,
  });

  final IconData icon;
  final String tag;
  final RegExp pattern;
  final RegExp? endPattern;
  final String example;
  final MarkdownWidgetBuilder builder;

  bool get isMultiline => endPattern != null;
}
