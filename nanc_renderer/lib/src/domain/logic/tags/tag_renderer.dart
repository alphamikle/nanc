import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import 'tag_description.dart';
import 'types/types.dart';

enum TagType {
  widget,
  sliver,
  property,
  other;

  bool get isWidget => this == TagType.widget;
  bool get isSliver => this == TagType.sliver;
  bool get isProperty => this == TagType.property;
  bool get isOther => this == TagType.other;
}

enum AvailableNuiWidget {
  any,
  scrollable,
  stack;

  bool get isAny => this == AvailableNuiWidget.any;
  bool get isScrollable => isAny || this == AvailableNuiWidget.scrollable;
  bool get isStack => isAny || this == AvailableNuiWidget.stack;
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
    this.override = false,
    this.availableNuiWidget = AvailableNuiWidget.any,
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

  /// Affects the availability of display type switching in Nanc CMS to avoid interface errors due to incorrectly constructed layout.
  /// In your own application you are responsible for what type of display / widget [NuiListWidget] or [NuiStackWidget] a tag will be in.
  final AvailableNuiWidget availableNuiWidget;

  /// Set this field to true, to override default renderer with the same tag
  final bool override;
}
