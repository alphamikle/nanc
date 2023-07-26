import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../../../../nanc_renderer.dart';
import '../../tools/widgets_compactor.dart';
import 'elevated_button_arguments.dart';

TagRenderer elevatedButtonRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_button_pointer,
    tagType: TagType.widget,
    tag: 'elevatedButton',
    description: TagDescription(
      description: '''
# Elevated button
      ''',
      arguments: [
        // TODO(alphamikle): arguments docs
      ],
      properties: [
        // TODO(alphamikle): properties docs
      ],
    ),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final ElevatedButtonArguments arguments = ElevatedButtonArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return ElevatedButton(
        style: null,
        onLongPress: handleEvent(context, arguments.onLongPress),
        onHover: arguments.onHover == null
            ? null
            : (bool isHovered) => handleEvent(
                  context,
                  '${arguments.onHover}${generateMetadata('isHovered', isHovered)}',
                )?.call(),
        onPressed: handleEvent(context, arguments.onPressed),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
