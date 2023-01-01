import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/renderers/safe_area/safe_area_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_description.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer safeAreaRenderer() {
  return TagRenderer(
    icon: IconPack.flu_resize_large_regular,
    tag: 'safeArea',
    pattern: RegExp(r'<safeArea.*>'),
    endPattern: RegExp('</safeArea>'),
    description: const TagDescription(
      description: '',
      arguments: [],
      properties: [],
    ),
    example: '''
<safeArea>
  <placeholder/>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final SafeAreaArguments arguments = SafeAreaArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      final EdgeInsets? minimumPadding = extractor.getProperty(minimum);

      return SafeArea(
        left: arguments.left ?? true,
        top: arguments.top ?? true,
        right: arguments.right ?? true,
        bottom: arguments.bottom ?? true,
        maintainBottomViewPadding: arguments.bottomViewPadding ?? false,
        minimum: minimumPadding ?? EdgeInsets.zero,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
