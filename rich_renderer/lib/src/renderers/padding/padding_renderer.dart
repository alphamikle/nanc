import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/properties/padding/padding_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer paddingRenderer() {
  return TagRenderer(
    icon: IconPack.flu_padding_right_regular,
    tag: 'padding',
    pattern: RegExp(r'<padding.*>'),
    endPattern: RegExp('</padding>'),
    example: '''
<description>
Padding

A widget that insets its child by the given padding

https://api.flutter.dev/flutter/widgets/Padding-class.html
</description>

#### Parameters

```
1.
<padding left="10" top="10" right="10" bottom="10">
  <placeholder/>
</padding>

2.
<padding all="10">
  <placeholder/>
</padding>
```

#### Example

<padding left="10" top="15" right="20" bottom="25">
  <placeholder/>
</padding>
  ''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final PaddingArguments arguments = PaddingArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Padding(
        padding: arguments.toPadding(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
