import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'fractional_translation_arguments.dart';

TagRenderer fractionalTranslationRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_triangle,
    tagType: TagType.widget,
    tag: 'fractionalTranslation',
    description: TagDescription(
      description: '''
# [Fractional Translation](https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html)

Applies a translation transformation before painting its child.

The translation is expressed as a [Offset](dart-ui/Offset-class.html) scaled to the child's size. For example, an [Offset](dart-ui/Offset-class.html) with a `dx` of 0.25 will result in a horizontal translation of one quarter the width of the child.
''',
      arguments: [
        dxArgument(),
        dyArgument(),
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
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final FractionalTranslationArguments arguments = FractionalTranslationArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return FractionalTranslation(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        translation: arguments.toOffset() ?? Offset.zero,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
