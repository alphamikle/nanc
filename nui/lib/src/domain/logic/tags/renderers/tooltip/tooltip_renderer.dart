import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'tooltip_arguments.dart';

TagRenderer tooltipRenderer() {
  return TagRenderer(
    icon: IconPack.flu_tooltip_quote_filled,
    tagType: TagType.widget,
    tag: 'tooltip',
    description: TagDescription(
      description: '''
# [Tooltip](https://api.flutter.dev/flutter/material/Tooltip-class.html)

A Material Design tooltip.

Tooltips provide text labels which help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget and provide a message which will be shown when the widget is long pressed.
''',
      arguments: [
        heightArgument(),
        textAlignArgument(),
        stringArgument(name: 'text'),
        boolArgument(name: 'below'),
        doubleArgument(name: 'offset'),
        durationArgument(name: 'showDuration'),
        durationArgument(name: 'waitDuration'),
      ],
      properties: [
        paddingProp(),
        paddingProp(name: margin),
        boxDecorationProp(),
        textStyleProp(),
      ],
    ),
    example: '''
<data text="The true measure of a person's worth is not in what they possess, but in what they give to others. Material possessions and wealth may bring temporary happiness and satisfaction, but true fulfillment and purpose come from making a positive impact on the lives of others. It is through selfless acts of kindness and generosity that we truly define ourselves and leave a lasting legacy."/>

<safeArea>
  <center>
    <tooltip text="{{ data.text }}" showDuration="2000" waitDuration="300" align="left">
      <prop:margin left="30" right="30"/>
      
      <sizedBox width="250">
        <text maxLines="1">
          <prop:textStyle overflow="ellipsis"/>
          {{ data.text }}
        </text>
      </sizedBox>
    </tooltip>
  </center>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TooltipArguments arguments = TooltipArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (arguments.text == null || arguments.text!.trim().isEmpty) {
        return compactWidgets(extractor.children);
      }

      return Tooltip(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        height: arguments.height,
        padding: extractor.getProperty(padding),
        decoration: extractor.getProperty(decoration),
        textAlign: arguments.align,
        textStyle: extractor.getProperty(textStyle),
        message: arguments.text!,
        preferBelow: arguments.below,
        verticalOffset: arguments.offset,
        showDuration: arguments.showDuration == null ? null : Duration(milliseconds: arguments.showDuration!),
        waitDuration: arguments.waitDuration == null ? null : Duration(milliseconds: arguments.waitDuration!),
        enableFeedback: true,
        margin: extractor.getProperty(margin),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
