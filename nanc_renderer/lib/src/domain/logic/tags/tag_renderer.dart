import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import 'tag_description.dart';
import 'types/types.dart';

enum TagType {
  widget,
  sliver,
  property,
  other,
}

/// ? Entity, which configures an any custom tag rendering logic
class TagRenderer<T extends Widget> {
  const TagRenderer({
    required this.icon,
    required this.tagType,
    required this.tag,
    required this.example,
    required this.builder,
    required this.description,
  });

  static TagRenderer empty() => TagRenderer<Widget>(
        icon: IconPack.mdi_help,
        tagType: TagType.widget,
        tag: '',
        example: '',
        builder: ($1, $2, $3) => const SizedBox(),
        description: const TagDescription(description: '', properties: [], arguments: []),
      );

  final IconData icon;
  final TagType tagType;
  final String tag;
  final String example;
  final TagDescription description;
  final NuiBuilder<T> builder;
}
