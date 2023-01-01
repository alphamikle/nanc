import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/renderers/text/text_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/text_extractor.dart';

TagRenderer textRenderer() {
  return TagRenderer(
    icon: IconPack.flu_text_field_regular,
    tag: 'text',
    pattern: RegExp(r'<text.*>'),
    endPattern: RegExp('</text>'),
    example: '''
<description>
Text

A run of text with a single style.

The Text widget displays a string of text with single style.
The string might break across multiple lines or might all be
displayed on the same line depending on the layout constraints.

The style argument is optional. When omitted, the text will use
the style from the closest enclosing DefaultTextStyle.
If the given style's TextStyle.inherit property is true (the default),
the given style will be merged with the closest enclosing DefaultTextStyle.
This merging behavior is useful, for example,
to make the text bold while using the default font family and size.

https://api.flutter.dev/flutter/widgets/Text-class.html
</description>

#### Parameters

1. Text with size and color
<text size="18" color="26D5AE">
This is a text example, hello!
</text>

2. Text with additional properties
<text>
  

Two households, both alike in dignity,
In fair Verona, where we lay our scene,
From ancient grudge break to new mutiny,
Where civil blood makes civil hands unclean.
From forth the fatal loins of these two foes
A pair of star-cross'd lovers take their life;
</text>

3. Text with additional properties
<text>
  <prop:textStyle decoration="lineThrough" overflow="fade" baseline="ideographic"/>
Whose misadventured piteous overthrows
Do with their death bury their parents' strife.
The fearful passage of their death-mark'd love,
And the continuance of their parents' rage,
Which, but their children's end, nought could remove,
Is now the two hours' traffic of our stage;
The which if you with patient ears attend,
What here shall miss, our toil shall strive to mend.
</text>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final TextArguments arguments = TextArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      TextStyle? style = extractor.getProperty(textStyle);

      style ??= const TextStyle();

      if (style.fontSize == null && arguments.size != null) {
        style = style.copyWith(fontSize: arguments.size);
      }
      if (style.color == null && arguments.color != null) {
        style = style.copyWith(color: arguments.color);
      }
      final List<String> content = await extractTextFromChildren(context: context, element: element);

      return Text(
        content.join('\n'),
        textDirection: arguments.direction,
        maxLines: arguments.maxLines,
        textAlign: arguments.align,
        overflow: arguments.overflow,
        softWrap: arguments.softWrap ?? true,
        style: style,
      );
    },
  );
}
