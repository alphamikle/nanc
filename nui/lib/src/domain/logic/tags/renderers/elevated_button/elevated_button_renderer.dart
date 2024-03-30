import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nui.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'elevated_button_arguments.dart';

TagRenderer elevatedButtonRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_button_pointer,
    tagType: TagType.widget,
    tag: 'elevatedButton',
    description: TagDescription(
      description: '''
# [Elevated button](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)

A Material Design "elevated button".

Use elevated buttons to add dimension to otherwise mostly flat layouts, e.g. in long busy lists of content, or in wide spaces. Avoid using elevated buttons on already-elevated content such as dialogs or cards.

An elevated button is a label [child](material/ButtonStyleButton/child.html) displayed on a [Material](material/Material-class.html) widget whose [Material.elevation](material/Material/elevation.html) increases when the button is pressed. The label's [Text](widgets/Text-class.html) and [Icon](widgets/Icon-class.html) widgets are displayed in [style](material/ButtonStyleButton/style.html)'s [ButtonStyle.foregroundColor](material/ButtonStyle/foregroundColor.html) and the button's filled background is the [ButtonStyle.backgroundColor](material/ButtonStyle/backgroundColor.html).

The elevated button's default style is defined by [defaultStyleOf](material/ElevatedButton/defaultStyleOf.html). The style of this elevated button can be overridden with its [style](material/ButtonStyleButton/style.html) parameter. The style of all elevated buttons in a subtree can be overridden with the [ElevatedButtonTheme](material/ElevatedButtonTheme-class.html), and the style of all of the elevated buttons in an app can be overridden with the [Theme](material/Theme-class.html)'s [ThemeData.elevatedButtonTheme](material/ThemeData/elevatedButtonTheme.html) property.

The static [styleFrom](material/ElevatedButton/styleFrom.html) method is a convenient way to create a elevated button [ButtonStyle](material/ButtonStyle-class.html) from simple values.

If [onPressed](material/ButtonStyleButton/onPressed.html) and [onLongPress](material/ButtonStyleButton/onLongPress.html) callbacks are null, then the button will be disabled.
      ''',
      arguments: [
        eventArgument(name: 'onPressed'),
        eventArgument(name: 'onHover', metaName: 'isHovered', metaValue: 'bool'),
        eventArgument(name: 'onLongPress'),
      ],
      properties: [
        buttonStyleProp(),
      ],
    ),
    example: '''
<safeArea>
  <elevatedButton onPressed="snackbar: Pressed!">
    <text>
      Press me!
    </text>
  </elevatedButton>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ElevatedButtonArguments arguments = ElevatedButtonArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return ElevatedButton(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        style: extractor.getProperty(buttonStyle),
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
        onPressed: handleEvent(context: context, event: arguments.onPressed),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
