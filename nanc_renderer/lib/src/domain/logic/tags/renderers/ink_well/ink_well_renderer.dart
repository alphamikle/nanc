import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../documentation/documentation.dart';
import '../../logic/event_delegate.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'ink_well_arguments.dart';

TagRenderer inkWellRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_button_pointer,
    tagType: TagType.widget,
    tag: 'inkWell',
    description: TagDescription(
      description: '''
# [InkWell](https://api.flutter.dev/flutter/material/InkWell-class.html)

A rectangular area of a [Material](material/Material-class.html) that responds to touch.

For a variant of this widget that does not clip splashes, see [InkResponse](material/InkResponse-class.html).

The following diagram shows how an [InkWell](material/InkWell-class.html) looks when tapped, when using default values.

![The highlight is a rectangle the size of the box.](https://flutter.github.io/assets-for-api-docs/assets/material/ink_well.png)

The [InkWell](material/InkWell-class.html) widget must have a [Material](material/Material-class.html) widget as an ancestor. The [Material](material/Material-class.html) widget is where the ink reactions are actually painted. This matches the Material Design premise wherein the [Material](material/Material-class.html) is what is actually reacting to touches by spreading ink.

> At this point, the InkWell widget plays a major role in user interaction. It is a standard Flutter widget that allows you to process user clicks. In the future, the capabilities to handle user input will be significantly expanded.
>
> To find out exactly how you can handle user presses, read the section with the `onPressed` parameter just below.
''',
      arguments: [
        colorArgument(name: 'focusColor'),
        colorArgument(name: 'overlayColor'),
        colorArgument(name: 'highlightColor'),
        colorArgument(name: 'splashColor'),
        colorArgument(name: 'hoverColor'),
        eventArgument(name: 'onPressed'),
        eventArgument(name: 'onDoubleTap'),
        eventArgument(name: 'onLongPress'),
        eventArgument(name: 'onHover'),
      ],
      properties: [
        borderRadiusProp(),
      ],
    ),
    example: '''
<safeArea>
    <center>
      <sizedBox height="60" width="60">
        <inkWell onPressed="snackbar: Here can be any string" onHover="snackbar: Hovered!" hoverColor="14BC5B">
          <placeholder/>
        </inkWell>
      </sizedBox>
    </center>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final InkWellArguments arguments = InkWellArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return InkWell(
        borderRadius: extractor.getProperty(borderRadius),
        focusColor: arguments.focusColor,
        overlayColor: arguments.overlayColor == null ? null : MaterialStatePropertyAll(arguments.overlayColor),
        highlightColor: arguments.highlightColor,
        splashColor: arguments.splashColor,
        hoverColor: arguments.hoverColor,
        onTap: handleEvent(context, arguments.onPressed),
        onDoubleTap: handleEvent(context, arguments.onDoubleTap),
        onLongPress: handleEvent(context, arguments.onLongPress),
        onHover: (bool isHovered) => handleEvent(
          context,
          arguments.onHover == null ? null : '${arguments.onHover}${generateMetadata('isHovered', isHovered)}',
        )?.call(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
