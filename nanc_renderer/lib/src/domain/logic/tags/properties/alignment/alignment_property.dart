import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import '../alignment/alignment_arguments.dart';
import 'alignment_property_widget.dart';

PropertyTagRenderer<Alignment> alignmentProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final AlignmentArguments arguments = AlignmentArguments.fromJson(element.attributes);

      return AlignmentPropertyWidget(
        name: tag,
        property: arguments.toAlignment(),
      );
    },
  );
}
