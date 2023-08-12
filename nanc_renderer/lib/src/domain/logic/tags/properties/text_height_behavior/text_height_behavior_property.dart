import 'package:flutter/material.dart';

import '../../../model/tag.dart';
import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'text_height_behavior_arguments.dart';
import 'text_height_behavior_property_widget.dart';

PropertyTagRenderer<TextHeightBehavior> textHeightBehaviorProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final TextHeightBehaviorArguments arguments = TextHeightBehaviorArguments.fromJson(element.attributes);

      return TextHeightBehaviorPropertyWidget(
        name: tag,
        property: TextHeightBehavior(
          applyHeightToFirstAscent: arguments.firstAscent ?? true,
          applyHeightToLastDescent: arguments.lastDescent ?? true,
          leadingDistribution: arguments.leadingDistribution ?? TextLeadingDistribution.proportional,
        ),
      );
    },
  );
}
