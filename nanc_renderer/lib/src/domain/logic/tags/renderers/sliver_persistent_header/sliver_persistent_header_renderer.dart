import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'sliver_persistent_header_arguments.dart';

TagRenderer sliverPersistentHeaderRenderer() {
  return TagRenderer(
    icon: IconPack.flu_document_header_regular,
    tagType: TagType.sliver,
    tag: 'sliverPersistentHeader',
    description: TagDescription(
      description: '''

      ''',
      arguments: [
        // TODO(alphamikle): arguments docs
      ],
      properties: [
        // TODO(alphamikle): properties docs
      ],
    ),
    example: '''
<data id="header" height="150"/>

<sliverPersistentHeader maxExtent="{{ data(header).height }}" minExtent="100" floating="true">
  <container color="lightBlue" height="{{ data(header).height }}">
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

<for in="{{ 0...16 }}">
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
