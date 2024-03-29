import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'default_text_style_arguments.dart';

TagRenderer defaultTextStyleRenderer() {
  return TagRenderer(
    icon: IconPack.flu_text_edit_style_filled,
    tagType: TagType.widget,
    tag: 'defaultTextStyle',
    description: TagDescription(
      description: '''
# [Default text style](https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html)

The text style to apply to descendant [Text](widgets/Text-class.html) widgets which don't have an explicit style.
      ''',
      arguments: [
        textOverflowArgument(),
        maxLinesArgument(),
        boolArgument(name: 'softWrap'),
        textAlignArgument(),
        doubleArgument(name: 'size'),
        colorArgument(name: 'color'),
        textWidthBasisArgument(),
      ],
      properties: [
        textStyleProp(),
        textHeightBehaviorProp(),
      ],
    ),
    example: '''
<safeArea>
  <defaultTextStyle size="18" color="green">
  <prop:textStyle weight="bold"/>
    <text>
      Hello my Dear Friend!
    </text>
  </defaultTextStyle>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final DefaultTextStyleArguments arguments = DefaultTextStyleArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      TextStyle? style = extractor.getProperty(textStyle);

      if (style == null && arguments.color == null && arguments.size == null) {
        return null;
      }

      style ??= const TextStyle();

      if (style.fontSize == null && arguments.size != null) {
        style = style.copyWith(fontSize: arguments.size);
      }
      if (style.color == null && arguments.color != null) {
        style = style.copyWith(color: arguments.color);
      }

      return DefaultTextStyle(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        textWidthBasis: arguments.widthBasis ?? TextWidthBasis.parent,
        textHeightBehavior: extractor.getProperty(textHeightBehavior),
        textAlign: arguments.align,
        softWrap: arguments.softWrap ?? true,
        maxLines: arguments.maxLines,
        overflow: arguments.overflow ?? TextOverflow.clip,
        style: style,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
