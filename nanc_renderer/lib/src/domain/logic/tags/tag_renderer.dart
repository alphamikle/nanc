import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/types/types.dart';

/// ? Entity, which configures an any custom tag rendering logic
class TagRenderer {
  const TagRenderer({
    required this.icon,
    required this.tag,
    required this.example,
    required this.builder,
    required this.description,
  });

  factory TagRenderer.empty() => TagRenderer(
        icon: IconPack.mdi_help,
        tag: '',
        example: '',
        builder: ($1, $2, $3) => const SizedBox(),
        description: const TagDescription(description: '', properties: [], arguments: []),
      );

  final IconData icon;
  final String tag;
  final String example;
  final TagDescription description;
  final MarkdownWidgetBuilder builder;
}
