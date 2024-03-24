import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'positioned_arguments.dart';

TagRenderer positionedRenderer() {
  return TagRenderer(
    icon: IconPack.flu_position_to_front_regular,
    tagType: TagType.widget,
    tag: 'positioned',
    description: TagDescription(
      description: '''
# [Positioned](https://api.flutter.dev/flutter/widgets/Positioned-class.html)

A widget that controls where a child of a [Stack](widgets/Stack-class.html) is positioned.

A [Positioned](widgets/Positioned-class.html) widget must be a descendant of a [Stack](widgets/Stack-class.html), and the path from the [Positioned](widgets/Positioned-class.html) widget to its enclosing [Stack](widgets/Stack-class.html) must contain only [StatelessWidget](widgets/StatelessWidget-class.html)s or [StatefulWidget](widgets/StatefulWidget-class.html)s (not other kinds of widgets, like [RenderObjectWidget](widgets/RenderObjectWidget-class.html)s).

If a widget is wrapped in a [Positioned](widgets/Positioned-class.html), then it is a _positioned_ widget in its [Stack](widgets/Stack-class.html). If the [top](widgets/Positioned/top.html) property is non-null, the top edge of this child will be positioned [top](widgets/Positioned/top.html) layout units from the top of the stack widget. The [right](widgets/Positioned/right.html), [bottom](widgets/Positioned/bottom.html), and [left](widgets/Positioned/left.html) properties work analogously.

If both the [top](widgets/Positioned/top.html) and [bottom](widgets/Positioned/bottom.html) properties are non-null, then the child will be forced to have exactly the height required to satisfy both constraints. Similarly, setting the [right](widgets/Positioned/right.html) and [left](widgets/Positioned/left.html) properties to non-null values will force the child to have a particular width. Alternatively the [width](widgets/Positioned/width.html) and [height](widgets/Positioned/height.html) properties can be used to give the dimensions, with one corresponding position property (e.g. [top](widgets/Positioned/top.html) and [height](widgets/Positioned/height.html)).

If all three values on a particular axis are null, then the [Stack.alignment](widgets/Stack/alignment.html) property is used to position the child.

If all six values are null, the child is a non-positioned child. The [Stack](widgets/Stack-class.html) uses only the non-positioned children to size itself.
''',
      arguments: [
        widthArgument(),
        heightArgument(),
        leftArgument(),
        topArgument(),
        rightArgument(),
        bottomArgument(),
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
      final PositionedArguments arguments = PositionedArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      final double? all = arguments.all;

      return Positioned(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        width: arguments.width,
        height: arguments.height,
        left: all ?? arguments.left,
        top: all ?? arguments.top,
        right: all ?? arguments.right,
        bottom: all ?? arguments.bottom,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
