import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'fade_in.dart';
import 'fade_in_arguments.dart';

TagRenderer fadeInRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_circle_opacity,
    tagType: TagType.widget,
    tag: 'fadeIn',
    description: TagDescription(
      description: '''
# Fade in

Fade in - its a special auto-animated widget, which will show its child after a some delay with "fadeIn" effect. That delay is equal to 250ms by default and possible to change by your hands.

Also, you are available to change Curve type of animation. More info about curves see in the `curve` argument description.
''',
      arguments: [
        durationArgument(name: 'duration'),
        durationArgument(name: 'delay'),
        curveArgument(name: 'curve'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <column>
    <fadeIn duration="1000" curve="bounceOut">
      <container size="200" color="#07B982">
      </container>
    </fadeIn>
    <fadeIn duration="1000" delay="300" curve="easeIn">
      <container size="200" color="#FF10A0CF">
      </container>
    </fadeIn>
  </column>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final FadeInArguments arguments = FadeInArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return FadeIn(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        duration: arguments.duration == null ? const Duration(milliseconds: 250) : Duration(milliseconds: arguments.duration!),
        delay: arguments.delay == null ? Duration.zero : Duration(milliseconds: arguments.delay!),
        curve: arguments.curve?.toCurve(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
