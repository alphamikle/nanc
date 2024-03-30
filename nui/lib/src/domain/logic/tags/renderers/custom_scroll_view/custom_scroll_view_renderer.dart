import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import 'custom_scroll_view_arguments.dart';

TagRenderer customScrollViewRenderer() {
  return TagRenderer(
    icon: IconPack.flu_phone_vertical_scroll_regular,
    tagType: TagType.widget,
    availableNuiWidget: AvailableNuiWidget.stack,
    tag: 'customScrollView',
    description: TagDescription(
      description: '''
# [Custom Scroll View](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html)

A [ScrollView](widgets/ScrollView-class.html) that creates custom scroll effects using [slivers](widgets/CustomScrollView/slivers.html).

A [CustomScrollView](widgets/CustomScrollView-class.html) lets you supply [slivers](widgets/CustomScrollView/slivers.html) directly to create various scrolling effects, such as lists, grids, and expanding headers. For example, to create a scroll view that contains an expanding app bar followed by a list and a grid, use a list of three slivers: [SliverAppBar](material/SliverAppBar-class.html), [SliverList](widgets/SliverList-class.html), and [SliverGrid](widgets/SliverGrid-class.html).

[Widget](widgets/Widget-class.html)s in these [slivers](widgets/CustomScrollView/slivers.html) must produce [RenderSliver](rendering/RenderSliver-class.html) objects.

To control the initial scroll offset of the scroll view, provide a [controller](widgets/ScrollView/controller.html) with its [ScrollController.initialScrollOffset](widgets/ScrollController/initialScrollOffset.html) property set.
      ''',
      arguments: [
        axisArgument(name: 'axis'),
        physicsArgument(name: 'physics'),
        cacheExtentArgument(name: 'cacheExtent'),
        boolArgument(name: 'reverse'),
        boolArgument(name: 'shrinkWrap'),
      ],
      properties: [],
    ),
    example: '''
<positioned all="0">
  <customScrollView>
    <sliverToBoxAdapter>
      <sizedBox height="8"/>
    </sliverToBoxAdapter>
    <sliverList>
      <for to="10">
        <padding left="8" right="8" bottom="8">
          <container height="100" color="red"/>
        </padding>
      </for>
    </sliverList>
    <sliverToBoxAdapter>
      <padding left="8" right="8" bottom="8">
        <container height="100" color="green"/>
      </padding>
    </sliverToBoxAdapter>
    <sliverPadding left="8" right="8">
      <sliverList>
        <for to="5">
          <padding bottom="8">
            <container height="100" color="yellow"/>
          </padding>
        </for>
      </sliverList>
    </sliverPadding>
    <sliverList>
      <for to="10">
        <padding left="8" right="8" bottom="8">
          <container height="100" color="blue"/>
        </padding>
      </for>
    </sliverList>
  </customScrollView>
</positioned>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final CustomScrollViewArguments arguments = CustomScrollViewArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;

      if (children.isEmpty) {
        return null;
      }

      return CustomScrollView(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        physics: arguments.physics?.toScrollPhysics(),
        scrollDirection: arguments.axis ?? Axis.vertical,
        cacheExtent: arguments.cacheExtent,
        reverse: arguments.reverse,
        shrinkWrap: arguments.shrinkWrap,
        slivers: children,
      );
    },
  );
}
