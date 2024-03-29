import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/widgets_compactor.dart';
import 'rotated_box_arguments.dart';

TagRenderer rotatedBoxRenderer() {
  return TagRenderer(
    icon: IconPack.flu_arrow_rotate_clockwise_filled,
    tagType: TagType.widget,
    tag: 'rotatedBox',
    description: TagDescription(
      description: '''
# [Rotated Box](https://api.flutter.dev/flutter/widgets/RotatedBox-class.html)

A widget that rotates its child by a integral number of quarter turns.

Unlike [Transform](widgets/Transform-class.html), which applies a transform just prior to painting, this object applies its rotation prior to layout, which means the entire rotated box consumes only as much space as required by the rotated child.
      ''',
      arguments: [
        intArgument(name: 'turns', description: 'The number of 90 degree steps by which you want to rotate the widget. It makes sense to specify from 1 to 3'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <center>
    <rotatedBox turns="3">
      <text size="32">
        Hello there!
      </text>
    </rotatedBox>
  </center>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final RotatedBoxArguments arguments = RotatedBoxArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (extractor.children.isEmpty) {
        return null;
      }

      return RotatedBox(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        quarterTurns: arguments.turns ?? 0,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
