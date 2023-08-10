import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import 'list_view_arguments.dart';

TagRenderer listViewRenderer() {
  return TagRenderer(
    icon: IconPack.flu_dual_screen_vertical_scroll_regular,
    tagType: TagType.widget,
    tag: 'listView',
    description: TagDescription(
      description: '''
# [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)

A scrollable list of widgets arranged linearly.

[ListView](widgets/ListView-class.html) is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the [ListView](widgets/ListView-class.html).

If non-null, the [itemExtent](widgets/ListView/itemExtent.html) forces the children to have the given extent in the scroll direction.

If non-null, the [prototypeItem](widgets/ListView/prototypeItem.html) forces the children to have the same extent as the given widget in the scroll direction.

Specifying an [itemExtent](widgets/ListView/itemExtent.html) or an [prototypeItem](widgets/ListView/prototypeItem.html) is more efficient than letting the children determine their own extent because the scrolling machinery can make use of the foreknowledge of the children's extent to save work, for example when the scroll position changes drastically.
      ''',
      arguments: [
        axisArgument(name: 'axis'),
        physicsArgument(name: 'physics'),
        cacheExtentArgument(name: 'cacheExtent'),
        itemExtentArgument(name: 'itemExtent'),
        boolArgument(name: 'reverse'),
        boolArgument(name: 'shrinkWrap'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <sizedBox height="100">
    <listView axis="horizontal">
      <for in="{{ 1...100 }}">
        <padding right="10">
          <placeholder width="100" height="100" text="{{ cycle.value }}"/>
        </padding>
      </for>
    </listView>
  </sizedBox>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ListViewArguments arguments = ListViewArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;

      if (children.isEmpty) {
        return null;
      }

      Widget builder(BuildContext context, int index) => children[index];

      return ListView.builder(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        itemBuilder: builder,
        itemCount: children.length,
        physics: arguments.physics?.toScrollPhysics(),
        scrollDirection: arguments.axis ?? Axis.vertical,
        cacheExtent: arguments.cacheExtent,
        itemExtent: arguments.itemExtent,
        reverse: arguments.reverse,
        shrinkWrap: arguments.shrinkWrap,
      );
    },
  );
}
