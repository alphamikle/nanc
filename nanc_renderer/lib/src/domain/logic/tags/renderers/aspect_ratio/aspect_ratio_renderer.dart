import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'aspect_ratio_arguments.dart';

TagRenderer aspectRatioRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_aspect_ratio,
    tagType: TagType.widget,
    tag: 'aspectRatio',
    description: TagDescription(
      description: '''
# Aspect ratio

A widget that attempts to size the child to a specific aspect ratio.

The widget first tries the largest width permitted by the layout constraints. The height of the widget is determined by applying the given aspect ratio to the width, expressed as a ratio of width to height.

For example, a 16:9 width:height aspect ratio would have a value of 16.0/9.0. If the maximum width is infinite, the initial width is determined by applying the aspect ratio to the maximum height.
''',
      arguments: [
        doubleArgument(name: 'ratio', description: 'Ratio argument should be greater than 0'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <aspectRatio ratio="{{ 16 / 9 }}">
    <container color="#FF07B982">
    </container>
  </aspectRatio>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final AspectRatioArguments arguments = AspectRatioArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (arguments.ratio == null || arguments.ratio! <= 0) {
        return compactWidgets(extractor.children);
      }

      return AspectRatio(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        aspectRatio: arguments.ratio!,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
