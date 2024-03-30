import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../properties/padding/padding_arguments.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';

TagRenderer paddingRenderer() {
  return TagRenderer(
    icon: IconPack.flu_padding_right_regular,
    tagType: TagType.widget,
    tag: 'padding',
    description: TagDescription(
      description: '''
# [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html)

A widget that insets its child by the given padding.

When passing layout constraints to its child, padding shrinks the constraints by the given padding, causing the child to layout at a smaller size. Padding then sizes itself to its child's size, inflated by the padding, effectively creating empty space around the child.
''',
      arguments: [
        leftArgument(),
        topArgument(),
        rightArgument(),
        bottomArgument(),
        allPaddingArgument(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <center>
    <container width="100" height="100" color="#457FDA">
      <padding all="8">
        <container color="#7BDA45">
        </container>
      </padding>
    </container>
  </center>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final PaddingArguments arguments = PaddingArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Padding(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        padding: arguments.toPadding(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
