import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renderer/src/domain/logic/tags/tag_description.dart';
import 'package:renderer/src/domain/logic/widgets_builder/widgets_builder.dart';
import 'package:xml/xml.dart';

typedef XmlWidgetBuilder = FutureOr<Widget?> Function(BuildContext context, XmlElement element, WidgetsBuilder widgetsBuilder);

/// ? Entity, which configures an any tag rendering logic
class TagRenderer {
  const TagRenderer({
    required this.tag,
    required this.builder,
    required this.description,
    required this.isPropertyTag,
  });

  factory TagRenderer.empty() => TagRenderer(
        tag: '',
        builder: ($1, $2, $3) => null,
        description: TagDescription.empty(),
        isPropertyTag: false,
      );

  final String tag;
  final TagDescription description;
  final XmlWidgetBuilder builder;
  final bool isPropertyTag;
}
