import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../../../../nanc_renderer.dart';
import 'sliver_list_arguments.dart';

TagRenderer sliverListRenderer() {
  return TagRenderer(
    icon: IconPack.flu_dual_screen_vertical_scroll_regular,
    tagType: TagType.sliver,
    availableNuiWidget: AvailableNuiWidget.scrollable,
    tag: 'sliverList',
    description: TagDescription(
      description: '''
# [Sliver List](https://api.flutter.dev/flutter/widgets/SliverList-class.html)

> This widget is intended for direct use inside `NuiListWidget`, or, you can place it inside the `<customScrollView>` tag if you are using `NuiStackWidget`.

A sliver that places multiple box children in a linear array along the main axis.

_To learn more about slivers, see [CustomScrollView.slivers](widgets/CustomScrollView/slivers.html)._

Each child is forced to have the [SliverConstraints.crossAxisExtent](rendering/SliverConstraints/crossAxisExtent.html) in the cross axis but determines its own main axis extent.

[SliverList](widgets/SliverList-class.html) determines its scroll offset by "dead reckoning" because children outside the visible part of the sliver are not materialized, which means [SliverList](widgets/SliverList-class.html) cannot learn their main axis extent. Instead, newly materialized children are placed adjacent to existing children.

If the children have a fixed extent in the main axis, consider using [SliverFixedExtentList](widgets/SliverFixedExtentList-class.html) rather than [SliverList](widgets/SliverList-class.html) because [SliverFixedExtentList](widgets/SliverFixedExtentList-class.html) does not need to perform layout on its children to obtain their extent in the main axis and is therefore more efficient.

> Pay attention to the `extent` parameter, if you know that all descendants of a given widget will be the same size along the scrolling axis - set this size as the `extent` value to further optimize performance.
''',
      arguments: [
        boolArgument(name: 'addKeepAlives'),
        boolArgument(name: 'addRepaintBoundaries'),
        boolArgument(name: 'addSemanticIndexes'),
        doubleArgument(
            name: 'extent',
            description:
                'If all elements of a given widget are assumed to be the same size along the scrolling axis, you can specify this size to further optimize performance.')
      ],
      properties: [],
    ),
    example: '''
<sliverList>
  <sizedBox height="8"/>
  <for in="{{ 0...100 }}">
    <padding left="8" right="8" bottom="8">
      <container height="50" color="green"/>
    </padding>
  </for>
</sliverList>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SliverListArguments arguments = SliverListArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;

      if (children.isEmpty) {
        return null;
      }

      Widget itemBuilder(BuildContext context, int index) {
        return children[index];
      }

      if (arguments.extent != null && arguments.extent! > 0) {
        return SliverFixedExtentList.builder(
          itemExtent: arguments.extent!,
          addAutomaticKeepAlives: arguments.addKeepAlives ?? true,
          addRepaintBoundaries: arguments.addRepaintBoundaries ?? true,
          addSemanticIndexes: arguments.addSemanticIndexes ?? true,
          itemBuilder: itemBuilder,
          itemCount: children.length,
        );
      }

      return SliverList.builder(
        addAutomaticKeepAlives: arguments.addKeepAlives ?? true,
        addRepaintBoundaries: arguments.addRepaintBoundaries ?? true,
        addSemanticIndexes: arguments.addSemanticIndexes ?? true,
        itemBuilder: itemBuilder,
        itemCount: children.length,
      );
    },
  );
}
