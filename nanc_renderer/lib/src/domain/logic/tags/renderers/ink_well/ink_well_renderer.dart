import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/logic/actions_handler.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/ink_well/ink_well_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_list.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/widgets_compactor.dart';

TagRenderer inkWellRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_button_pointer,
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
        colorArg('focusColor'),
        colorArg('overlayColor'),
        colorArg('highlightColor'),
        colorArg('splashColor'),
        colorArg('hoverColor'),
        onPressedArg(),
      ],
      properties: [
        borderRadiusProp(),
      ],
    ),
    example: '''
<safeArea>
    <center>
      <sizedBox height="60" width="60">
        <inkWell onPressed="snackbar: Here can be any string" hoverColor="14BC5B">
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
        // ignore: use_build_context_synchronously
        onTap: handleClick(context, arguments.onPressed),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
