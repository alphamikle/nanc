import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'inline_span/inline_span_collector.dart';
import 'rich_text_arguments.dart';

TagRenderer richTextRenderer() {
  return TagRenderer(
    icon: IconPack.flu_draw_text_filled,
    tagType: TagType.widget,
    tag: 'richText',
    description: TagDescription(
      description: '''
# [Rich Text](https://api.flutter.dev/flutter/widgets/RichText-class.html)

A paragraph of rich text.

The [RichText](widgets/RichText-class.html) widget displays text that uses multiple different styles. The text to display is described using a tree of [TextSpan](painting/TextSpan-class.html) objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.

Text displayed in a [RichText](widgets/RichText-class.html) widget must be explicitly styled. When picking which style to use, consider using [DefaultTextStyle.of](widgets/DefaultTextStyle/of.html) the current [BuildContext](widgets/BuildContext-class.html) to provide defaults. For more details on how to style text in a [RichText](widgets/RichText-class.html) widget, see the documentation for [TextStyle](painting/TextStyle-class.html).

Consider using the [Text](widgets/Text-class.html) widget to integrate with the [DefaultTextStyle](widgets/DefaultTextStyle-class.html) automatically. When all the text uses the same style, the default constructor is less verbose. The [Text.rich](widgets/Text/Text.rich.html) constructor allows you to style multiple spans with the default text style while still allowing specified styles per span.

This sample demonstrates how to mix and match text with different text styles using the [RichText](widgets/RichText-class.html) Widget. It displays the text "Hello bold world," emphasizing the word "bold" using a bold font weight.

![](https://flutter.github.io/assets-for-api-docs/assets/widgets/rich_text.png)

> Only widgets/tags of `<textSpan>` or `<widgetSpan>` type can be placed inside this widget/tag.
      ''',
      arguments: [
        textDirectionArgument(),
        textOverflowArgument(),
        maxLinesArgument(),
        colorArgument(name: 'selectionColor'),
        boolArgument(name: 'softWrap'),
        textAlignArgument(),
        doubleArgument(name: 'scaleFactor'),
        doubleArgument(name: 'size'),
        colorArgument(name: 'color'),
        textWidthBasisArgument(),
      ],
      properties: [
        textStyleProp(),
        strutStyleProp(),
        textHeightBehaviorProp(),
      ],
    ),
    example: '''
<safeArea>
  <padding all="8">
    <richText size="18" color="yellow">
      <textSpan text="Hello " color="black" onPressed="snackbar: Hello!"/>
      <textSpan text="Jack! " color="red"/>
      <widgetSpan alignment="baseline" baseline="alphabetic">
        <container>
          <prop:decoration color="pink">
            <prop:borderRadius all="4"/>
          </prop:decoration>

          <padding left="4" top="0" right="4" bottom="0">
            <text size="18" color="blue">
              How are you?
            </text>
          </padding>
        </container>
      </widgetSpan>
      <textSpan size="18" text=" Let's go to walk!" color="green"/>
      <textSpan separator=" " color="gray">
        <prop:textStyle font="Aboreto"/>
        It's seems,
        there are a very good weather!
      </textSpan>
    </richText>
  </padding>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final RichTextArguments arguments = RichTextArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<InlineSpan> inlineSpans = collectInlineSpans(extractor.children);

      if (inlineSpans.isEmpty) {
        return null;
      }

      InlineSpan inlineSpan;

      if (inlineSpans.length == 1) {
        inlineSpan = inlineSpans.first;
      } else {
        inlineSpan = TextSpan(children: inlineSpans);
      }

      TextStyle? style = extractor.getProperty(textStyle);

      if (style?.fontSize == null && arguments.size != null) {
        style = (style ?? const TextStyle()).copyWith(fontSize: arguments.size);
      }
      if (style?.color == null && arguments.color != null) {
        style = (style ?? const TextStyle()).copyWith(color: arguments.color);
      }

      if (style != null) {
        inlineSpan = TextSpan(style: style, children: [inlineSpan]);
      }

      return RichText(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        text: inlineSpan,
        textDirection: arguments.textDirection,
        overflow: arguments.overflow ?? TextOverflow.clip,
        maxLines: arguments.maxLines,
        selectionColor: arguments.selectionColor,
        softWrap: arguments.softWrap ?? true, textScaler: TextScaler.linear(arguments.scaleFactor ?? 1),
        strutStyle: extractor.getProperty(strutStyle),
        textAlign: arguments.align ?? TextAlign.start,
        textHeightBehavior: extractor.getProperty(textHeightBehavior),
        textWidthBasis: arguments.widthBasis ?? TextWidthBasis.parent,
      );
    },
  );
}
