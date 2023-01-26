import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/logic/actions_handler.dart';
import 'package:rich_renderer/src/renderers/ink_well/ink_well_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer inkWellRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_button_pointer,
    tag: 'inkWell',
    pattern: RegExp(r'<inkWell.*>'),
    endPattern: RegExp('</inkWell>'),
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
        stringArg('onPressed', '''
> ### Tap handling
>
> At the moment, one way to handle custom presses is to set the event parameters as the value of the `onPressed` argument. You can use anything you want as this value and handle these events any way you want.
>
> For example - there are only a few handlers implemented in this demo:
> * snackbar: <event> - shows the text specified in <event> with the widget `SnackBar`.
> * browser: <event> - allows you to open an external link through the built-in browser / WebView
> * deeplink: <event> - allows to open an internal link of the application, for example - to go to another screen
> *(fow now, demo application doesn't support any different routes or deep-links)*
> * share: <content> - allows to share something, which is places instead of `<content`
>
> In a real, production-ready application, you are not limited to implementing event handlers and can do whatever you want.
> 
> In the nearest future we're going to implement the feature of writing logic of almost any complexity with Dart, right in Nanc (in your browser!), which will allow you to implement any of your ideas, immediately check it in Nanc, and make it available to your users in a moment, without the need to republish the application in AppStore or GooglePlay. And yes! It's possible with Flutter.
'''),
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final InkWellArguments arguments = InkWellArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

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
