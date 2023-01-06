import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/size_arguments.dart';
import 'package:rich_renderer/src/documentation/properties/box_decoration.dart';
import 'package:rich_renderer/src/renderers/container/container_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

const String _description = '''
# [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)

A convenience widget that combines common painting, positioning, and sizing widgets.

A container first surrounds the child with [padding](widgets/Container/padding.html) (inflated by any borders present in the [decoration](widgets/Container/decoration.html)) and then applies additional [constraints](widgets/Container/constraints.html) to the padded extent (incorporating the `width` and `height` as constraints, if either is non-null). The container is then surrounded by additional empty space described from the [margin](widgets/Container/margin.html).

During painting, the container first applies the given [transform](widgets/Container/transform.html), then paints the [decoration](widgets/Container/decoration.html) to fill the padded extent, then it paints the child, and finally paints the [foregroundDecoration](widgets/Container/foregroundDecoration.html), also filling the padded extent.

Containers with no children try to be as big as possible unless the incoming constraints are unbounded, in which case they try to be as small as possible. Containers with children size themselves to their children. The `width`, `height`, and [constraints](widgets/Container/constraints.html) arguments to the constructor override this.
''';

TagRenderer containerRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_texture_box,
    tag: 'container',
    pattern: RegExp(r'<container.*>'),
    endPattern: RegExp(r'</container>'),
    description: TagDescription(
      description: _description,
      properties: [
        boxDecorationProp(),
        // TODO(alphamikle): Continue another props of the container and before it - create a logic to shot widgets props and arguments description (like in the colorArg)
      ],
      arguments: [
        widthArg(),
        heightArg(),
        colorArg(),
      ],
    ),
    example: '''
<container width="100" height="50" color="#457FDA">
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ContainerArguments arguments = ContainerArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      final BoxDecoration? boxDecoration = extractor.getProperty(decoration);

      return Container(
        width: arguments.width,
        height: arguments.height,
        color: boxDecoration != null ? null : arguments.color,
        alignment: extractor.getProperty(alignment),
        padding: extractor.getProperty(padding),
        decoration: boxDecoration?.copyWith(color: boxDecoration.color ?? arguments.color),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
