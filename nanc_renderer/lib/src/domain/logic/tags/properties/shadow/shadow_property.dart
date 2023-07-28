import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../model/tag.dart';
import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'shadow_arguments.dart';
import 'shadow_property_widget.dart';

PropertyTagRenderer<BoxShadow> shadowProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final ShadowArguments arguments = ShadowArguments.fromJson(element.attributes);

      return ShadowPropertyWidget(
        name: tag,
        property: arguments.toBoxShadow(context),
      );
    },
  );
}
