import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/text_extractor.dart';
import 'text_arguments.dart';

TagRenderer textRenderer() {
  return TagRenderer(
    icon: IconPack.flu_text_field_regular,
    tagType: TagType.widget,
    tag: 'text',
    description: TagDescription(
      description: '''
# [Text]()

A run of text with a single style.

The [Text](widgets/Text-class.html) widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints.

The [style](widgets/Text/style.html) argument is optional. When omitted, the text will use the style from the closest enclosing [DefaultTextStyle](widgets/DefaultTextStyle-class.html). If the given style's [TextStyle.inherit](painting/TextStyle/inherit.html) property is true (the default), the given style will be merged with the closest enclosing [DefaultTextStyle](widgets/DefaultTextStyle-class.html). This merging behavior is useful, for example, to make the text bold while using the default font family and size.

This example shows how to display text using the [Text](widgets/Text-class.html) widget with the [overflow](widgets/Text/overflow.html) set to [TextOverflow.ellipsis](painting/TextOverflow.html).

![If the text is shorter than the available space, it is displayed in full without an ellipsis.](https://flutter.github.io/assets-for-api-docs/assets/widgets/text.png)

![If the text overflows, the Text widget displays an ellipsis to trim the overflowing text](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_ellipsis.png)
''',
      arguments: [
        textDirectionArgument(name: 'direction'),
        maxLinesArgument(),
        textAlignArgument(),
        textOverflowArgument(),
        boolArgument(name: 'softWrap'),
        fontSizeArgument(),
        colorArgument(name: 'color'),
      ],
      properties: [
        textStyleProp(),
      ],
    ),
    example: '''
<safeArea>
  <text size="18">
    <prop:textStyle font="Rowdies"/>
    NANC, the content management system,
    A tool that's easy to use,
    With features that stand out from the rest,
    NANC helps businesses grow and thrive,
    Managing content with style and finesse,
    NANC, the CMS we can't resist.
  </text>
  <divider height="50"/>
  <text size="20" color="#AE23A6">
    NANC, the CMS that's best,
    Integrating with ease,
    Updating mobile apps with zest.
  </text>
  <divider height="50"/>
  <text>
    <prop:textStyle color="#23AE53" size="16" font="Merriweather"/>
    Why did the developer choose NANC as their content management system?
    Because it was the only CMS that could manage their content without making a mess!
  </text>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TextArguments arguments = TextArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      TextStyle? style = extractor.getProperty(textStyle);

      style ??= const TextStyle();

      if (style.fontSize == null && arguments.size != null) {
        style = style.copyWith(fontSize: arguments.size);
      }
      if (style.color == null && arguments.color != null) {
        style = style.copyWith(color: arguments.color);
      }
      final List<String> content = extractTextFromChildren(context: context, element: element);

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
