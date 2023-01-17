import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:rich_renderer/src/tag_description.dart';
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
    required this.description,
  });

  factory TagRenderer.empty() => TagRenderer(
        icon: IconPack.mdi_help,
        tag: '',
        pattern: RegExp(''),
        endPattern: RegExp(''),
        example: '',
        builder: ($1, $2, $3) => const SizedBox(),
        description: const TagDescription(description: '', properties: [], arguments: []),
      );

  final IconData icon;
  final String tag;
  final RegExp pattern;
  final RegExp? endPattern;
  final String example;
  final TagDescription description;
  final MarkdownWidgetBuilder builder;

  bool get isMultiline => endPattern != null;
}
