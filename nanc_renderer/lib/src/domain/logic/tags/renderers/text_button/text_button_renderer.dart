import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../logic/event_delegate.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'text_button_arguments.dart';

TagRenderer textButtonRenderer() {
  return TagRenderer(
    icon: IconPack.flu_text_case_lowercase_filled,
    tagType: TagType.widget,
    tag: 'textButton',
    description: TagDescription(
      description: '''
# [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)

Use text buttons on toolbars, in dialogs, or inline with other content but offset from that content with padding so that the button's presence is obvious. Text buttons do not have visible borders and must therefore rely on their position relative to other content for context. In dialogs and cards, they should be grouped together in one of the bottom corners. Avoid using text buttons where they would blend in with other content, for example in the middle of lists.

A text button is a label [child](material/ButtonStyleButton/child.html) displayed on a (zero elevation) [Material](material/Material-class.html) widget. The label's [Text](widgets/Text-class.html) and [Icon](widgets/Icon-class.html) widgets are displayed in the [style](material/ButtonStyleButton/style.html)'s [ButtonStyle.foregroundColor](material/ButtonStyle/foregroundColor.html). The button reacts to touches by filling with the [style](material/ButtonStyleButton/style.html)'s [ButtonStyle.backgroundColor](material/ButtonStyle/backgroundColor.html).

The text button's default style is defined by [defaultStyleOf](material/TextButton/defaultStyleOf.html). The style of this text button can be overridden with its [style](material/ButtonStyleButton/style.html) parameter. The style of all text buttons in a subtree can be overridden with the [TextButtonTheme](material/TextButtonTheme-class.html) and the style of all of the text buttons in an app can be overridden with the [Theme](material/Theme-class.html)'s [ThemeData.textButtonTheme](material/ThemeData/textButtonTheme.html) property.

The static [styleFrom](material/TextButton/styleFrom.html) method is a convenient way to create a text button [ButtonStyle](material/ButtonStyle-class.html) from simple values.

If the [onPressed](material/ButtonStyleButton/onPressed.html) and [onLongPress](material/ButtonStyleButton/onLongPress.html) callbacks are null, then this button will be disabled, it will not react to touch.
''',
      arguments: [
        eventArgument(name: 'onPressed'),
        eventArgument(name: 'onLongPress'),
        eventArgument(name: 'onHover', metaName: 'isHovered', metaValue: 'bool'),
        stringArgument(name: 'text'),
      ],
      properties: [
        buttonStyleProp(),
      ],
    ),
    example: '''
<safeArea>
  <center>
    <textButton text="Simple example" onPressed="snackbar: Do nothing">
      <prop:buttonStyle foregroundColor="blue"/>
    </textButton>
  </center>
  <center>
    <textButton onPressed="snackbar: Do nothing">
      <text>
        Complex example
      </text>
    </textButton>
  </center>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TextButtonArguments arguments = TextButtonArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      Widget? child;
      if (extractor.children.isNotEmpty) {
        child = compactWidgets(extractor.children, toRow: true);
      } else if (arguments.text != null && arguments.text != '') {
        child = Text(arguments.text!);
      }
      if (child == null) {
        return null;
      }

      return TextButton(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        onPressed: handleEvent(context: context, event: arguments.onPressed),
        onLongPress: handleEvent(context: context, event: arguments.onLongPress),
        onHover: arguments.onHover == null
            ? null
            : (bool isHovered) async => handleEvent(
                  context: context,
                  event: arguments.onHover,
                  meta: {
                    'isHovered': isHovered,
                  },
                )?.call(),
        style: extractor.getProperty(buttonStyle),
        child: child,
      );
    },
  );
}
