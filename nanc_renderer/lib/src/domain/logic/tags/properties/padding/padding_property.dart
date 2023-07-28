import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'padding_arguments.dart';
import 'padding_property_widget.dart';

PropertyTagRenderer<EdgeInsets> paddingProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final PaddingArguments arguments = PaddingArguments.fromJson(element.attributes);

      return PaddingPropertyWidget(name: tag, property: arguments.toPadding());
    },
  );
}