import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/container/container_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

const String _example = '''
<description>
Container

A container first surrounds the child with padding (inflated by any borders present in the decoration)
and then applies additional constraints to the padded extent (incorporating the width and height as constraints,
if either is non-null). The container is then surrounded by additional empty space described from the margin.

https://api.flutter.dev/flutter/widgets/Container-class.html
</description>

#### Parameters

1. Container with color and dimensions
<container height="150" width="200" color="A72588">
  <placeholder/>
</container>

2. Container with additional parameters: padding
<container color="14C861">
  <prop:padding left="50" bottom="80"/>
  <placeholder/>
</container>

3. Container with decoration and alignment params
<container>
  <prop:alignment x="0.5" y="-0.75"/>
  <prop:decoration>
    <prop:borderRadius topLeft="10" topRight="20" bottomRight="30" bottomLeft="40"/>
    <prop:border color="A72588" width="3"/>
    <prop:shadow color="CA0F0F" blurRadius="8" spreadRadius="-4" offsetX="-10" offsetY ="-10"/>
    <prop:shadow color="9EE117" blurRadius="8" spreadRadius="-4" offsetX="10" offsetY ="-10"/>
    <prop:shadow color="122CB5" blurRadius="8" spreadRadius="-4" offsetX="10" offsetY ="10"/>
    <prop:shadow color="CB0EB1" blurRadius="8" spreadRadius="-4" offsetX="-10" offsetY ="10"/>
    <prop:gradient>
      <prop:color color="DD3030"/>
      <prop:color color="30B8DD"/>
      <prop:stop value="0.35"/>
      <prop:stop value="1"/>
      <prop:alignment x="-1" y="0.5"/>
      <prop:alignment x="1" y="0.5"/>
    </prop:gradient>
  </prop:decoration>

  <padding all="20">
    <placeholder/>
  </padding>
</container>

#### Example

<container height="250">
  <prop:padding all="16"/>
  <prop:decoration color="2513D666" colorBlend="multiply">
    <prop:borderRadius topLeft="16" bottomRight="16"/>
  </prop:decoration>
  <placeholder/>
</container>
''';

TagRenderer containerRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'container',
    pattern: RegExp(r'<container.*>'),
    endPattern: RegExp(r'</container>'),
    example: _example,
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
