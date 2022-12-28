import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/center/center_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer centerRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'center',
    pattern: RegExp(r'<center.*>'),
    endPattern: RegExp('</center>'),
    example: '''
<description>
Center

A widget that centers its child within itself.

This widget will be as big as possible if its dimensions are constrained and
widthFactor and heightFactor are null. If a dimension is unconstrained and the
corresponding size factor is null then the widget will match its child's size in
that dimension. If a size factor is non-null then the corresponding dimension of
this widget will be the product of the child's dimension and the size factor.
For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.

https://api.flutter.dev/flutter/widgets/Center-class.html
</description>

#### Parameters

<container height="300" color="DF93F1">
  <center>
    <container width="50" height="50" color="CFF093">
      <prop:decoration>
        <prop:borderRadius all="16"/>
      </prop:decoration>
    </container>
  </center>
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final CenterArguments arguments = CenterArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Center(
        heightFactor: arguments.heightFactor,
        widthFactor: arguments.widthFactor,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
