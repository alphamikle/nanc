import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/widgets_compactor.dart';
import 'sliver_persistent_header_arguments.dart';

TagRenderer sliverPersistentHeaderRenderer() {
  return TagRenderer(
    icon: IconPack.flu_document_header_regular,
    tagType: TagType.sliver,
    availableNuiWidget: AvailableNuiWidget.scrollable,
    tag: 'sliverPersistentHeader',
    description: TagDescription(
      description: '''
# [Sliver Persistent Header](https://api.flutter.dev/flutter/widgets/SliverPersistentHeader-class.html)

A sliver whose size varies when the sliver is scrolled to the edge of the viewport opposite the sliver's [GrowthDirection](rendering/GrowthDirection.html).

In the normal case of a [CustomScrollView](widgets/CustomScrollView-class.html) with no centered sliver, this sliver will vary its size when scrolled to the leading edge of the viewport.

This is the layout primitive that [SliverAppBar](material/SliverAppBar-class.html) uses for its shrinking/growing effect.
      ''',
      arguments: [
        boolArgument(name: 'pinned'),
        boolArgument(name: 'floating'),
        doubleArgument(name: 'maxExtent'),
        doubleArgument(name: 'minExtent'),
        doubleArgument(name: 'height', description: 'Specifying this field is equivalent to specifying `maxExtent` and `minExtent` of the same value.'),
      ],
      properties: [],
    ),
    example: '''
<data header.height="150"/>

<sliverPersistentHeader maxExtent="{{ data.header.height }}" minExtent="100" floating="true">
  <container color="lightBlue" height="{{ data.header.height }}">
    <padding left="8">
      <row crossAxisAlignment="center">
        <text align="left">
          <prop:textStyle size="20"/>
          Sliver app
        </text>
      </row>
    </padding>
  </container>
</sliverPersistentHeader>

<sizedBox height="8"/>

<for to="16">
  <padding left="8" right="8" bottom="8">
    <container height="80" color="#FFCCCCCC"/>
  </padding>
</for>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SliverPersistentHeaderArguments arguments = SliverPersistentHeaderArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if ((arguments.minExtent == null && arguments.maxExtent == null && arguments.height == null) || extractor.children.isEmpty) {
        return null;
      }

      return SliverPersistentHeader(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        pinned: arguments.pinned ?? false,
        floating: arguments.floating ?? false,
        delegate: _Delegate(
          minExtent: arguments.height ?? arguments.minExtent ?? arguments.maxExtent!,
          maxExtent: arguments.height ?? arguments.maxExtent ?? arguments.minExtent!,
          child: compactWidgets(extractor.children),
        ),
      );
    },
  );
}

class _Delegate extends SliverPersistentHeaderDelegate {
  const _Delegate({
    required this.maxExtent,
    required this.minExtent,
    required this.child,
  });

  final Widget child;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_Delegate oldDelegate) => oldDelegate != this;
}
