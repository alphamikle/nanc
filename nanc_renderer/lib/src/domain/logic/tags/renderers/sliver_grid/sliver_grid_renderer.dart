import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/arguments/scalar_arguments.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../sliver_list/sliver_list_renderer.dart';
import 'sliver_grid_arguments.dart';

TagRenderer sliverGridRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_grid_large,
    tagType: TagType.sliver,
    availableNuiWidget: AvailableNuiWidget.scrollable,
    tag: 'sliverGrid',
    description: TagDescription(
      description: '''
# [Sliver Grid](https://api.flutter.dev/flutter/widgets/SliverGrid-class.html)

> This widget is intended for direct use inside `NuiListWidget`, or, you can place it inside the `<customScrollView>` tag if you are using `NuiStackWidget`.

A sliver that places multiple box children in a two dimensional arrangement.

_To learn more about slivers, see [CustomScrollView.slivers](widgets/CustomScrollView/slivers.html)._

[SliverGrid](widgets/SliverGrid-class.html) places its children in arbitrary positions determined by [gridDelegate](widgets/SliverGrid/gridDelegate.html). Each child is forced to have the size specified by the [gridDelegate](widgets/SliverGrid/gridDelegate.html).

The main axis direction of a grid is the direction in which it scrolls; the cross axis direction is the orthogonal direction.

> Pay attention to the `extent` parameter, if you know that all descendants of a given widget will be the same size along the scrolling axis - set this size as the `extent` value to further optimize performance.
''',
      arguments: [
        ...sliverListRenderer().description.arguments,
        intArgument(name: 'crossAxisCount', description: 'Number of columns in the grid (the width of children will be adjusted to this parameter)'),
        doubleArgument(name: 'childAspectRatio'),
        doubleArgument(name: 'crossAxisSpacing'),
        doubleArgument(name: 'mainAxisSpacing'),
        doubleArgument(name: 'maxCrossAxisExtent', description: 'Maximum width of each child element (the number of columns will adjust to this parameter)'),
      ],
      properties: [],
    ),
    example: '''
<sliverGrid crossAxisCount="5" crossAxisSpacing="8" mainAxisSpacing="8" extent="100">
  <for in="{{ 0...50 }}">
    <container color="red"/>
  </for>
</sliverGrid>
<sizedBox height="8"/>
<sliverGrid crossAxisCount="5" childAspectRatio="1.33" crossAxisSpacing="8" mainAxisSpacing="8">
  <for in="{{ 0...50 }}">
    <container color="blue"/>
  </for>
</sliverGrid>
<sizedBox height="8"/>
<sliverGrid childAspectRatio="1.33" crossAxisSpacing="8" mainAxisSpacing="8" maxCrossAxisExtent="100">
  <for in="{{ 0...50 }}">
    <container color="green"/>
  </for>
</sliverGrid>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SliverGridArguments arguments = SliverGridArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;

      if (children.isEmpty) {
        return null;
      }

      final bool explicitCrossAxisCount = arguments.crossAxisCount != null && arguments.crossAxisCount! > 0;
      final bool explicitMaxCrossAxisExtent = arguments.maxCrossAxisExtent != null && arguments.maxCrossAxisExtent! > 0;

      if (explicitCrossAxisCount == false && explicitMaxCrossAxisExtent == false) {
        return null;
      }

      final SliverGridDelegate gridDelegate = explicitCrossAxisCount
          ? SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: arguments.crossAxisCount!,
              childAspectRatio: arguments.childAspectRatio ?? 1,
              crossAxisSpacing: arguments.crossAxisSpacing ?? 0,
              mainAxisExtent: arguments.extent,
              mainAxisSpacing: arguments.mainAxisSpacing ?? 0,
            )
          : SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: arguments.maxCrossAxisExtent!,
              childAspectRatio: arguments.childAspectRatio ?? 1,
              crossAxisSpacing: arguments.crossAxisSpacing ?? 0,
              mainAxisExtent: arguments.extent,
              mainAxisSpacing: arguments.mainAxisSpacing ?? 0,
            );

      return SliverGrid.builder(
        gridDelegate: gridDelegate,
        itemBuilder: (BuildContext context, int index) => children[index],
        itemCount: children.length,
        addAutomaticKeepAlives: arguments.addKeepAlives ?? true,
        addRepaintBoundaries: arguments.addRepaintBoundaries ?? true,
        addSemanticIndexes: arguments.addSemanticIndexes ?? true,
      );
    },
  );
}
