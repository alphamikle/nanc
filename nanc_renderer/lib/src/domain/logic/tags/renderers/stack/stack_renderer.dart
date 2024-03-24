import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import 'stack_arguments.dart';

TagRenderer stackRenderer() {
  return TagRenderer(
    icon: IconPack.flu_stack_regular,
    tagType: TagType.widget,
    tag: 'stack',
    description: TagDescription(
      description: '''
# [Stack](https://api.flutter.dev/flutter/widgets/Stack-class.html)

A widget that positions its children relative to the edges of its box.

This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.

Each child of a [Stack](widgets/Stack-class.html) widget is either _positioned_ or _non-positioned_. Positioned children are those wrapped in a [Positioned](widgets/Positioned-class.html) widget that has at least one non-null property. The stack sizes itself to contain all the non-positioned children, which are positioned according to [alignment](widgets/Stack/alignment.html) (which defaults to the top-left corner in left-to-right environments and the top-right corner in right-to-left environments). The positioned children are then placed relative to the stack according to their top, right, bottom, and left properties.

The stack paints its children in order with the first child being at the bottom. If you want to change the order in which the children paint, you can rebuild the stack with the children in the new order. If you reorder the children in this way, consider giving the children non-null keys. These keys will cause the framework to move the underlying objects for the children to their new locations rather than recreate them at their new location.

For more details about the stack layout algorithm, see [RenderStack](rendering/RenderStack-class.html).

If you want to lay a number of children out in a particular pattern, or if you want to make a custom layout manager, you probably want to use [CustomMultiChildLayout](widgets/CustomMultiChildLayout-class.html) instead. In particular, when using a [Stack](widgets/Stack-class.html) you can't position children relative to their size or the stack's own size.

Using a [Stack](widgets/Stack-class.html) you can position widgets over one another.
''',
      arguments: [
        stackFitArgument(name: 'fit'),
        xArgument(),
        yArgument(),
        alignmentArgument(name: 'align'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <stack>
    <container height="400" width="400" color="#457FDA">
    </container>
    <positioned left="0" top="0">
      <container height="50" width="50" color="#7BDA45">
      </container>
    </positioned>
    <positioned left="100" top="100">
      <container height="50" width="50" color="#DA9745">
      </container>
    </positioned>
    <positioned right="150" top="150" width="50" height="50">
      <container color="#7BDA45">
      </container>
    </positioned>
  </stack>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final StackArguments arguments = StackArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Stack(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        fit: arguments.fit ?? StackFit.loose,
        alignment: arguments.toAlignment() ?? Alignment.topLeft,
        children: extractor.children,
      );
    },
  );
}
