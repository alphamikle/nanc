import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/size_arguments.dart';
import 'package:rich_renderer/src/documentation/properties/alignment.dart';
import 'package:rich_renderer/src/documentation/properties/box_decoration.dart';
import 'package:rich_renderer/src/documentation/properties/padding.dart';
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
        alignmentProp(),
        paddingProp(),
      ],
      arguments: [
        widthArg(),
        heightArg(),
        colorArg(),
        sizeArg(),
      ],
    ),
    example: '''
<container width="300" height="500" color="#457FDA">
  <prop:alignment align="center"/>
  
  <container width="150" height="150">
    <prop:padding left="4" top="6" right="8" bottom="10"/>
    <prop:decoration color="#7BDA45">
      <prop:borderRadius topLeft="16" bottomRight="16"/>
      <prop:border color="#000" width="4"/>
      <prop:shadow color="#CE37CE" blurRadius="8" spreadRadius="12" offsetX="10" offsetY="10"/>
      <prop:shadow color="#CEA537" blurRadius="12" spreadRadius="8" offsetX="-10" offsetY="-10"/>
      <prop:gradient>
        <prop:begin align="centerLeft"/>
        <prop:end align="centerRight"/>
        <!-- Color and Stop properties can be as many, as you want -->
        <prop:color color="#CE3756"/>
        <prop:color color="#CF7184"/>
        <prop:stop value="0.25"/>
        <prop:stop value="0.5"/>
      </prop:gradient>
    </prop:decoration>
    <container color="#A6A114">
    </container>
  </container>
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ContainerArguments arguments = ContainerArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      final BoxDecoration? boxDecoration = extractor.getProperty(decoration);

      return Container(
        width: arguments.size ?? arguments.width,
        height: arguments.size ?? arguments.height,
        color: boxDecoration != null ? null : arguments.color,
        alignment: extractor.getProperty(alignment),
        padding: extractor.getProperty(padding),
        decoration: boxDecoration?.copyWith(color: boxDecoration.color ?? arguments.color),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
