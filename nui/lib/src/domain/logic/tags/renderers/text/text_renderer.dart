import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

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
# [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)

A run of text with a single style.

The [Text](widgets/Text-class.html) widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints.

The [style](widgets/Text/style.html) argument is optional. When omitted, the text will use the style from the closest enclosing [DefaultTextStyle](widgets/DefaultTextStyle-class.html). If the given style's [TextStyle.inherit](painting/TextStyle/inherit.html) property is true (the default), the given style will be merged with the closest enclosing [DefaultTextStyle](widgets/DefaultTextStyle-class.html). This merging behavior is useful, for example, to make the text bold while using the default font family and size.

This example shows how to display text using the [Text](widgets/Text-class.html) widget with the [overflow](widgets/Text/overflow.html) set to [TextOverflow.ellipsis](painting/TextOverflow.html).

![If the text is shorter than the available space, it is displayed in full without an ellipsis.](https://flutter.github.io/assets-for-api-docs/assets/widgets/text.png)

![If the text overflows, the Text widget displays an ellipsis to trim the overflowing text](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_ellipsis.png)

You can specify text content inside this widget as just inside a tag:

```html
<text>
  Hello world!
</text>
```

As well as using the `text` parameter:

```html
<text text="Hello world!"/>
```

''',
      arguments: [
        stringArgument(name: 'text'),
        textDirectionArgument(name: 'direction'),
        maxLinesArgument(),
        textAlignArgument(),
        textOverflowArgument(),
        boolArgument(name: 'softWrap'),
        fontSizeArgument(),
        colorArgument(name: 'color'),
        separatorArgument(),
        skipEmptyLinesArgument(),
      ],
      properties: [
        textStyleProp(),
      ],
    ),
    example: '''
<safeArea>
  <text size="18">
    <prop:textStyle font="Rowdies"/>
    In the world of code and fancy trance,
    Lives a tool that's known as Nanc.
    It twists and turns, through data it dances,
    Making devs smile with second chances.
  
    No more headaches, no more fuss,
    Nanc's here to help, without a cuss.
    With a click and a drag, it's all so clear,
    Building apps, we now cheer!
  
    So here's to Nanc, our digital lance,
    Cutting through problems, giving us a chance.
    In the land of code, it takes a stance,
    Thank you, dear Nanc, for enhancing our dance!
  </text>
  
  <divider height="50"/>
  
  <text size="20" color="#AE23A6">
    Nanc, the CMS that's best,
    Integrating with ease,
    Updating mobile apps with zest.
  </text>
  
  <divider height="50"/>
  
  <text>
    <prop:textStyle color="#23AE53" size="16" font="Merriweather"/>
    Why did the developer choose Nanc as their content management system?
    Because it was the only CMS that could manage their content without making a mess!
  </text>
  
  <divider height="50"/>
  
  <text text="Hello there!"/>
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
      final List<String> content = extractTextFromChildren(context, element, skipEmptyLines: arguments.skipEmptyLines ?? true);

      return Text(
        arguments.text ?? content.join(arguments.separator ?? '\n'),
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
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
