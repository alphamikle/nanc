import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nanc_renderer.dart';
import '../data_builder/data_builder_renderer.dart';
import 'switch_arguments.dart';

TagRenderer switchRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_toggle_switch,
    tagType: TagType.widget,
    tag: 'switch',
    description: TagDescription(description: '''
# [Switcher](https://api.flutter.dev/flutter/material/Switch-class.html)

A Material Design switch.

Used to toggle the on/off state of a single setting.

The switch itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the [onChanged](material/Switch/onChanged.html) callback. Most widgets that use a switch will listen for the [onChanged](material/Switch/onChanged.html) callback and rebuild the switch with a new [value](material/Switch/value.html) to update the visual appearance of the switch.

If the [onChanged](material/Switch/onChanged.html) callback is null, then the switch will be disabled (it will not respond to input). A disabled switch's thumb and track are rendered in shades of grey by default. The default appearance of a disabled switch can be overridden with [inactiveThumbColor](material/Switch/inactiveThumbColor.html) and [inactiveTrackColor](material/Switch/inactiveTrackColor.html).

Requires one of its ancestors to be a [Material](material/Material-class.html) widget.

Material Design 3 provides the option to add icons on the thumb of the [Switch](material/Switch-class.html). If [ThemeData.useMaterial3](material/ThemeData/useMaterial3.html) is set to true, users can use [Switch.thumbIcon](material/Switch/thumbIcon.html) to add optional Icons based on the different [MaterialState](material/MaterialState.html)s of the [Switch](material/Switch-class.html).
      ''', arguments: [
      boolArgument(name: 'value'),
      switchStyleArgument(),
      eventArgument(name: 'onChanged', metaName: 'value', metaValue: 'bool'),
      cursorArgument(),
      colorArgument(name: 'activeColor'),
      colorArgument(name: 'activeTrackColor'),
      colorArgument(name: 'focusColor'),
      colorArgument(name: 'hoverColor'),
      colorArgument(name: 'inactiveThumbColor'),
      colorArgument(name: 'inactiveTrackColor'),
      colorArgument(name: 'overlayColor'),
      colorArgument(name: 'thumbColor'),
      colorArgument(name: 'trackColor'),
      colorArgument(name: 'trackOutlineColor'),
      colorArgument(name: 'trackOutlineWidth'),
      colorArgument(name: 'splashRadius'),
    ], properties: [], aliases: [
      const TagAlias(
        name: 'icon',
        values: {'Icon', '<icon/>'},
      ),
    ]),
    example: dataBuilderRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SwitchArguments arguments = SwitchArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final Widget? icon = extractor.getAlias('icon');

      if (arguments.style?.isCupertino ?? false) {
        return CupertinoSwitch(
          activeColor: arguments.activeColor,
          trackColor: arguments.trackColor,
          thumbColor: arguments.thumbColor,
          focusColor: arguments.focusColor,
          value: arguments.value ?? false,
          onChanged: (bool value) async => handleEvent(context: context, event: arguments.onChanged, meta: {
            'value': value,
          })?.call(),
        );
      }

      return Switch(
        mouseCursor: arguments.cursor?.toMouseCursor(),
        activeColor: arguments.activeColor,
        activeTrackColor: arguments.activeTrackColor,
        focusColor: arguments.focusColor,
        hoverColor: arguments.hoverColor,
        inactiveThumbColor: arguments.inactiveThumbColor,
        inactiveTrackColor: arguments.inactiveTrackColor,
        overlayColor: arguments.overlayColor == null ? null : MaterialStatePropertyAll(arguments.overlayColor),
        splashRadius: arguments.splashRadius,
        thumbColor: arguments.thumbColor == null ? null : MaterialStatePropertyAll(arguments.thumbColor),
        thumbIcon: icon is Icon ? MaterialStatePropertyAll(icon) : null,
        trackColor: arguments.trackColor == null ? null : MaterialStatePropertyAll(arguments.trackColor),
        trackOutlineColor: arguments.trackOutlineColor == null ? null : MaterialStatePropertyAll(arguments.trackOutlineColor),
        trackOutlineWidth: arguments.trackOutlineWidth == null ? null : MaterialStatePropertyAll(arguments.trackOutlineWidth),
        value: arguments.value ?? false,
        onChanged: (bool value) async => handleEvent(context: context, event: arguments.onChanged, meta: {
          'value': value,
        })?.call(),
      );
    },
  );
}
