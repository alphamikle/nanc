import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import '../custom_scroll_view/custom_scroll_view_renderer.dart';
import '../key_argument.dart';

TagRenderer sliverToBoxAdapterRenderer() {
  return TagRenderer(
    icon: IconPack.flu_convert_range_regular,
    tagType: TagType.sliver,
    availableNuiWidget: AvailableNuiWidget.stack,
    tag: 'sliverToBoxAdapter',
    description: const TagDescription(
      description: '''
# [Sliver to box adapter](https://api.flutter.dev/flutter/widgets/SliverToBoxAdapter-class.html)

> This widget is intended for direct use only inside of `<customScrollView>` tag if you are using `NuiStackWidget`. All the widgets within `NuiListWidget` do not required to be wrapped by this tag.

A sliver that contains a single box widget.

Slivers are special-purpose widgets that can be combined using a [CustomScrollView](widgets/CustomScrollView-class.html) to create custom scroll effects. A [SliverToBoxAdapter](widgets/SliverToBoxAdapter-class.html) is a basic sliver that creates a bridge back to one of the usual box-based widgets.

_To learn more about slivers, see [CustomScrollView.slivers](widgets/CustomScrollView/slivers.html)._

Rather than using multiple [SliverToBoxAdapter](widgets/SliverToBoxAdapter-class.html) widgets to display multiple box widgets in a [CustomScrollView](widgets/CustomScrollView-class.html), consider using [SliverList](widgets/SliverList-class.html), [SliverFixedExtentList](widgets/SliverFixedExtentList-class.html), [SliverPrototypeExtentList](widgets/SliverPrototypeExtentList-class.html), or [SliverGrid](widgets/SliverGrid-class.html), which are more efficient because they instantiate only those children that are actually visible through the scroll view's viewport.
      ''',
      arguments: [],
      properties: [],
    ),
    example: customScrollViewRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final KeyArgument keyArgument = KeyArgument.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return SliverToBoxAdapter(
        key: (keyArgument.key?.isEmpty ?? true) ? null : ValueKey(keyArgument.key),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
