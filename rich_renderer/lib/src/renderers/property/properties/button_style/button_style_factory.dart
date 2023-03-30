import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/button_style/button_style_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/button_style/button_style_property_widget.dart';

Future<ButtonStylePropertyWidget> buttonStyleFactory({
  required BuildContext context,
  required String name,
  required md.Element element,
  required RichRenderer richRenderer,
}) async {
  final ButtonStyleArguments arguments = ButtonStyleArguments.fromJson(element.attributes);
  // final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

  final ButtonStyle buttonStyle = ButtonStyle(
    // side: null,
    // mouseCursor: null,
    // animationDuration: null,
    // enableFeedback: null,
    // fixedSize: null,
    // maximumSize: null,
    // minimumSize: null,
    // padding: null,
    // shape: null,
    // splashFactory: null,
    // tapTargetSize: null,
    // textStyle: null,
    // visualDensity: null,
    backgroundColor: arguments.backgroundColor == null ? null : MaterialStatePropertyAll(arguments.backgroundColor),
    alignment: arguments.align == null ? null : alignmentEnumToAlignment(arguments.align!),
    elevation: arguments.elevation == null ? null : MaterialStatePropertyAll(arguments.elevation),
    foregroundColor: arguments.foregroundColor == null ? null : MaterialStatePropertyAll(arguments.foregroundColor),
    iconColor: arguments.iconColor == null ? null : MaterialStatePropertyAll(arguments.iconColor),
    iconSize: arguments.iconSize == null ? null : MaterialStatePropertyAll(arguments.iconSize),
    overlayColor: arguments.overlayColor == null ? null : MaterialStatePropertyAll(arguments.overlayColor),
    shadowColor: arguments.shadowColor == null ? null : MaterialStatePropertyAll(arguments.shadowColor),
    surfaceTintColor: arguments.surfaceTintColor == null ? null : MaterialStatePropertyAll(arguments.surfaceTintColor),
  );

  return ButtonStylePropertyWidget(name: name, property: buttonStyle);
}