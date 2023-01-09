import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/documentation/arguments/size_arguments.dart';
import 'package:rich_renderer/src/renderers/fractional_translation/fractional_translation_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_description.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer fractionalTranslationRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_triangle,
    tag: 'fractionalTranslation',
    pattern: RegExp(r'<fractionalTranslation.*>'),
    endPattern: RegExp('</fractionalTranslation>'),
    description: TagDescription(
      description: '''
# [Fractional Translation](https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html)

Applies a translation transformation before painting its child.

The translation is expressed as a [Offset](dart-ui/Offset-class.html) scaled to the child's size. For example, an [Offset](dart-ui/Offset-class.html) with a `dx` of 0.25 will result in a horizontal translation of one quarter the width of the child.
''',
      arguments: [
        dxArg(),
        dyArg(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <container>
  </container>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final FractionalTranslationArguments arguments = FractionalTranslationArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return FractionalTranslation(
        translation: arguments.toOffset() ?? Offset.zero,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
