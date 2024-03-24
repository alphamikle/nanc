import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'expanded_arguments.dart';

TagRenderer expandedRenderer() {
  return TagRenderer(
    icon: IconPack.flu_arrow_autofit_content_regular,
    tagType: TagType.widget,
    tag: 'expanded',
    description: TagDescription(
      description: '''
# [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html)

A widget that expands a child of a [Row](widgets/Row-class.html), [Column](widgets/Column-class.html), or [Flex](widgets/Flex-class.html) so that the child fills the available space.

Using an [Expanded](widgets/Expanded-class.html) widget makes a child of a [Row](widgets/Row-class.html), [Column](widgets/Column-class.html), or [Flex](widgets/Flex-class.html) expand to fill the available space along the main axis (e.g., horizontally for a [Row](widgets/Row-class.html) or vertically for a [Column](widgets/Column-class.html)). If multiple children are expanded, the available space is divided among them according to the [flex](widgets/Flexible/flex.html) factor.

An [Expanded](widgets/Expanded-class.html) widget must be a descendant of a [Row](widgets/Row-class.html), [Column](widgets/Column-class.html), or [Flex](widgets/Flex-class.html), and the path from the [Expanded](widgets/Expanded-class.html) widget to its enclosing [Row](widgets/Row-class.html), [Column](widgets/Column-class.html), or [Flex](widgets/Flex-class.html) must contain only [StatelessWidget](widgets/StatelessWidget-class.html)s or [StatefulWidget](widgets/StatefulWidget-class.html)s (not other kinds of widgets, like [RenderObjectWidget](widgets/RenderObjectWidget-class.html)s).
''',
      arguments: [
        flexArgument(),
      ],
      properties: [],
    ),
    example: '''
<data filled="65"/>

<safeArea>
  <row>
    <expanded flex="{{ data.filled }}">
      <container height="50" color="#457FDA">
      </container>
    </expanded>
    <expanded flex="{{ 100 - data.filled }}">
      <container height="50" color="#7BDA45">
      </container>
    </expanded>
  </row>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ExpandedArguments arguments = ExpandedArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Expanded(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        flex: arguments.flex ?? 1,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
