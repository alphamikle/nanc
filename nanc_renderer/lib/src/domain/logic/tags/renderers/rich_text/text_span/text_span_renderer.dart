import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../../documentation/documentation.dart';
import '../../../logic/event_delegate.dart';
import '../../../rich_renderer.dart';
import '../../../tag_description.dart';
import '../../../tag_renderer.dart';
import '../../../tools/properties_extractor.dart';
import '../../../tools/properties_names.dart';
import '../../../tools/text_extractor.dart';
import '../inline_span/inline_span_collector.dart';
import '../inline_span/inline_span_proxy_widget.dart';
import '../rich_text_renderer.dart';
import 'text_span_arguments.dart';

TagRenderer textSpanRenderer() {
  return TagRenderer(
    icon: IconPack.flu_slide_text_filled,
    tagType: TagType.widget,
    tag: 'textSpan',
    description: TagDescription(
      description: '''
# [Text Span](https://api.flutter.dev/flutter/painting/TextSpan-class.html)

An immutable span of text.

A [TextSpan](painting/TextSpan-class.html) object can be styled using its [style](painting/InlineSpan/style.html) property. The style will be applied to the [text](painting/TextSpan/text.html) and the [children](painting/TextSpan/children.html).

A [TextSpan](painting/TextSpan-class.html) object can just have plain text, or it can have children [TextSpan](painting/TextSpan-class.html) objects with their own styles that (possibly only partially) override the [style](painting/InlineSpan/style.html) of this object. If a [TextSpan](painting/TextSpan-class.html) has both [text](painting/TextSpan/text.html) and [children](painting/TextSpan/children.html), then the [text](painting/TextSpan/text.html) is treated as if it was an un-styled [TextSpan](painting/TextSpan-class.html) at the start of the [children](painting/TextSpan/children.html) list. Leaving the [TextSpan.text](painting/TextSpan/text.html) field null results in the [TextSpan](painting/TextSpan-class.html) acting as an empty node in the [InlineSpan](painting/InlineSpan-class.html) tree with a list of children.

> This widget/tag can only be placed inside a `<richText>` or other `<textSpan>` widget/tag.
      ''',
      arguments: [
        stringArgument(name: 'text'),
        cursorArgument(),
        eventArgument(name: 'onEnter'),
        eventArgument(name: 'onExit'),
        eventArgument(name: 'onPressed'),
        colorArgument(name: 'color'),
        doubleArgument(name: 'size'),
        boolArgument(name: 'spellOut'),
        separatorArgument(),
        skipEmptyLinesArgument(),
      ],
      properties: [
        textStyleProp(),
      ],
    ),
    example: richTextRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TextSpanArguments arguments = TextSpanArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<String> content = extractTextFromChild(context, element, skipEmptyLines: arguments.skipEmptyLines ?? true);

      final List<InlineSpan> inlineSpans = collectInlineSpans(extractor.children);

      if (arguments.text?.isEmpty ?? true && inlineSpans.isEmpty && content.isEmpty) {
        return null;
      }

      // TODO(alphamikle): Need to check
      TextStyle? style = extractor.getProperty(textStyle) ?? const TextStyle(inherit: false);

      if (style.fontSize == null && arguments.size != null) {
        style = style.copyWith(fontSize: arguments.size);
      }
      if (style.color == null && arguments.color != null) {
        style = style.copyWith(color: arguments.color);
      }

      return InlineSpanProxyWidget(
        inlineSpan: TextSpan(
          text: arguments.text ?? content.join(arguments.separator ?? '\n'),
          children: inlineSpans,
          style: style,
          mouseCursor: arguments.cursor?.toMouseCursor(),
          onEnter: arguments.onEnter?.isEmpty ?? true ? null : (_) async => handleEvent(context: context, event: arguments.onEnter)!.call(),
          onExit: arguments.onExit?.isEmpty ?? true ? null : (_) async => handleEvent(context: context, event: arguments.onEnter)!.call(),
          recognizer: arguments.onPressed?.isEmpty ?? true ? null : (TapGestureRecognizer()..onTap = handleEvent(context: context, event: arguments.onPressed)),
          spellOut: arguments.spellOut,
        ),
      );
    },
  );
}
