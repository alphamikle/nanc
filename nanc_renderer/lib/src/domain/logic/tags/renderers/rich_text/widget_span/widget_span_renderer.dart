import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../../documentation/documentation.dart';
import '../../../rich_renderer.dart';
import '../../../tag_description.dart';
import '../../../tag_renderer.dart';
import '../../../tools/properties_extractor.dart';
import '../../../tools/properties_names.dart';
import '../../../tools/widgets_compactor.dart';
import '../inline_span/inline_span_proxy_widget.dart';
import '../rich_text_renderer.dart';
import 'widget_span_arguments.dart';

TagRenderer widgetSpanRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_image_text,
    tagType: TagType.widget,
    tag: 'widgetSpan',
    description: TagDescription(
      description: '''
# [Widget Span](https://api.flutter.dev/flutter/widgets/WidgetSpan-class.html)

An immutable widget that is embedded inline within text.

The [child](widgets/WidgetSpan/child.html) property is the widget that will be embedded. Children are constrained by the width of the paragraph.

The [child](widgets/WidgetSpan/child.html) property may contain its own [Widget](widgets/Widget-class.html) children (if applicable), including [Text](widgets/Text-class.html) and [RichText](widgets/RichText-class.html) widgets which may include additional [WidgetSpan](widgets/WidgetSpan-class.html)s. Child [Text](widgets/Text-class.html) and [RichText](widgets/RichText-class.html) widgets will be laid out independently and occupy a rectangular space in the parent text layout.

> This widget/tag can only be placed inside a `<richText>` or `<textSpan>` widget/tag. However, you can place any widget/tag inside of this tag.
      ''',
      arguments: [
        textBaselineArgument(),
        placeholderAlignmentArgument(),
      ],
      properties: [
        textStyleProp(),
      ],
    ),
    example: richTextRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final WidgetSpanArguments arguments = WidgetSpanArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;

      if (children.isEmpty) {
        return null;
      }

      return InlineSpanProxyWidget(
        inlineSpan: WidgetSpan(
          child: compactWidgets(children),
          style: extractor.getProperty(textStyle),
          baseline: arguments.baseline,
          alignment: arguments.alignment ?? PlaceholderAlignment.bottom,
        ),
      );
    },
  );
}
