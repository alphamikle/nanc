import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/widgets_compactor.dart';
import '../property/mapper/properties_extractor.dart';
import '../property/properties/padding/padding_arguments.dart';

TagRenderer paddingRenderer() {
  return TagRenderer(
    icon: IconPack.flu_padding_right_regular,
    tag: 'padding',
    description: TagDescription(
      description: '''
# [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html)

A widget that insets its child by the given padding.

When passing layout constraints to its child, padding shrinks the constraints by the given padding, causing the child to layout at a smaller size. Padding then sizes itself to its child's size, inflated by the padding, effectively creating empty space around the child.
''',
      arguments: [
        leftArg(),
        topArg(),
        rightArg(),
        bottomArg(),
        allPaddingArg(),
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final PaddingArguments arguments = PaddingArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Padding(
        padding: arguments.toPadding(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
