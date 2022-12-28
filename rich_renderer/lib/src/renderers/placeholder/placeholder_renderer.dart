import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/placeholder/placeholder_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer placeholderRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'placeholder',
    pattern: RegExp(r'<placeholder.*/>'),
    endPattern: null,
    example: '''
<description>
Placeholder

A widget that draws a box that represents where other widgets will one day be added

This widget is useful during development to indicate that the interface is not yet complete

By default, the placeholder is sized to fit its container. If the placeholder is in an unbounded space,
it will size itself according to the given fallbackWidth and fallbackHeight.

https://api.flutter.dev/flutter/widgets/Placeholder-class.html
</description>    

<placeholder color="#FF28C018" height="50" width="100" strokeWidth="3" text="I'm groot"/>
<placeholder color="#FF28C018" height="100" width="300" strokeWidth="1"/>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final PlaceholderArguments arguments = PlaceholderArguments.fromJson(element.attributes);

      return Placeholder(
        color: arguments.color ?? Colors.black,
        fallbackHeight: arguments.height ?? MediaQuery.of(context).size.height / 2,
        fallbackWidth: arguments.width ?? MediaQuery.of(context).size.width,
        strokeWidth: arguments.strokeWidth ?? 2,
        child: arguments.hasText
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: Text(arguments.text!),
              )
            : null,
      );
    },
  );
}
