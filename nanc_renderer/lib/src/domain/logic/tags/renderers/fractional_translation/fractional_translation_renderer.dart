import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/fractional_translation/fractional_translation_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/widgets_compactor.dart';

TagRenderer fractionalTranslationRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_triangle,
    tag: 'fractionalTranslation',
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
  <center>
    <fractionalTranslation dx="0.25" dy="1">
      <container width="100" height="100" color="#457FDA">
        <prop:decoration>
          <prop:borderRadius all="100"/>
        </prop:decoration>
      </container>
    </fractionalTranslation>
  </center>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final FractionalTranslationArguments arguments = FractionalTranslationArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return FractionalTranslation(
        translation: arguments.toOffset() ?? Offset.zero,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
