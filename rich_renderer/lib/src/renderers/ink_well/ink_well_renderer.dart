import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/logic/actions_handler.dart';
import 'package:rich_renderer/src/renderers/ink_well/ink_well_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer inkWellRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'inkWell',
    pattern: RegExp(r'<inkWell.*>'),
    endPattern: RegExp('</inkWell>'),
    example: '''
<description>
InkWell

A rectangular area of a Material that responds to touch.

For a variant of this widget that does not clip splashes, see InkResponse.

https://api.flutter.dev/flutter/material/InkWell-class.html
</description>

#### Parameters

1. Hover color
<inkWell onPressed="Here can be any string" hoverColor="14BC5B">
  <placeholder height="60"/>
</inkWell>

2. Focus color
<inkWell onPressed="2" focusColor="14BC5B">
  <placeholder height="60"/>
</inkWell>

3. Overlay color
<inkWell onPressed="2" overlayColor="14BC5B">
  <placeholder height="60"/>
</inkWell>

4. Highlight color
<inkWell onPressed="2" highlightColor="14BC5B">
  <placeholder height="60"/>
</inkWell>

5. Splash color
<inkWell onPressed="2" splashColor="14BC5B">
  <placeholder height="60"/>
</inkWell>

6. Not pressable
<inkWell>
  <placeholder height="60"/>
</inkWell>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final InkWellArguments arguments = InkWellArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return InkWell(
        borderRadius: extractor.getProperty(borderRadius),
        focusColor: arguments.focusColor,
        overlayColor: arguments.overlayColor == null ? null : MaterialStatePropertyAll(arguments.overlayColor),
        highlightColor: arguments.highlightColor,
        splashColor: arguments.splashColor,
        hoverColor: arguments.hoverColor,
        onTap: handleClick(context, arguments.onPressed),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
