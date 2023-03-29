import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/action_arguments.dart';
import 'package:rich_renderer/src/documentation/properties/button_style.dart';
import 'package:rich_renderer/src/logic/actions_handler.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/renderers/text_button/text_button_arguments.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer textButtonRenderer() {
  return TagRenderer(
    icon: IconPack.flu_text_case_lowercase_filled,
    // TODO(alphamikle): Here is a some problem with that tag. Maybe it is forbidden???
    tag: r'textButton',
    pattern: RegExp(r'<textButton.*>'),
    endPattern: RegExp('</textButton>'),
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
        onPressedArg(),
        stringArg('text'),
      ],
      properties: [
        buttonStyleProp(),
      ],
    ),
    example: '''
<safeArea>
  <center>
    <textButton text="Simple example" onPressed="snackbar: Do nothing">
      <prop:buttonStyle foregroundColor="#FF88DDFF"/>
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final TextButtonArguments arguments = TextButtonArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
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
        // ignore: use_build_context_synchronously
        onPressed: handleClick(context, arguments.onPressed),
        style: extractor.getProperty(buttonStyle),
        child: child,
      );
    },
  );
}
