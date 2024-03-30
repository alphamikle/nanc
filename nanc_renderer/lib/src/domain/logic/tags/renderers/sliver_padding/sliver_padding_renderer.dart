import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../properties/padding/padding_arguments.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../custom_scroll_view/custom_scroll_view_renderer.dart';

TagRenderer sliverPaddingRenderer() {
  return TagRenderer(
    icon: IconPack.flu_padding_right_regular,
    tagType: TagType.sliver,
    availableNuiWidget: AvailableNuiWidget.stack,
    tag: 'sliverPadding',
    description: TagDescription(
      description: '''
# [Sliver Padding](https://api.flutter.dev/flutter/widgets/SliverPadding-class.html)

> This widget is intended for direct use inside `NuiListWidget`, or, you can place it inside the `<customScrollView>` tag if you are using `NuiStackWidget`.

A sliver that applies padding on each side of another sliver.

Slivers are special-purpose widgets that can be combined using a [CustomScrollView](widgets/CustomScrollView-class.html) to create custom scroll effects. A [SliverPadding](widgets/SliverPadding-class.html) is a basic sliver that insets another sliver by applying padding on each side.

Applying padding in the main extent of the viewport to slivers that have scroll effects is likely to have undesired effects. For example, For example, wrapping a [SliverPersistentHeader](widgets/SliverPersistentHeader-class.html) with `pinned:true` will cause only the appbar to stay pinned while the padding will scroll away.
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
    example: customScrollViewRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final PaddingArguments arguments = PaddingArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;

      if (children.isEmpty) {
        return null;
      }

      return SliverPadding(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        padding: arguments.toPadding(),
        sliver: children.first,
      );
    },
  );
}
