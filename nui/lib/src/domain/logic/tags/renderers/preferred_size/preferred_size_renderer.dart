import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nui.dart';
import '../../tools/widgets_compactor.dart';
import 'preferred_size_arguments.dart';

TagRenderer preferredSizeRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_move_resize,
    tagType: TagType.widget,
    availableNuiWidget: AvailableNuiWidget.scrollable,
    tag: 'preferredSize',
    description: TagDescription(
      description: '''
# [Preferred Size Widget](https://api.flutter.dev/flutter/widgets/PreferredSize-class.html)

A widget with a preferred size.
This widget does not impose any constraints on its child, and it doesn't affect the child's layout in any way. It just advertises a preferred size which can be used by the parent.
''',
      arguments: [
        heightArgument(),
        widthArgument(),
      ],
      properties: [],
    ),
    example: '''
<sliverAppBar floating="true" stretch="true" onStretchTrigger="snackbar: Stretched">
  <alias name="title">
    <text>
      Nanc App
    </text>
  </alias>
  <alias name="bottom">
    <preferredSize height="40">
      <center>
        <container height="40" width="200" color="yellow"/>
      </center>
    </preferredSize>
  </alias>
</sliverAppBar>

<sizedBox height="8"/>

<for to="10">
  <padding left="8" right="8" bottom="8">
    <container height="50" color="#80FF0000"/>
  </padding>
  <padding left="8" right="8" bottom="8">
    <container height="50" color="#8000FF24"/>
  </padding>
  <padding left="8" right="8" bottom="8">
    <container height="50" color="#8021A0E6"/>
  </padding>
</for>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final PreferredSizeArguments arguments = PreferredSizeArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (extractor.children.isEmpty || arguments.height == null || arguments.height! <= 0) {
        return null;
      }

      return PreferredSize(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        preferredSize: Size(arguments.width ?? double.infinity, arguments.height!),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
