import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../../../../nanc_renderer.dart';
import '../../logic/actions_handler.dart';
import '../../tools/widgets_compactor.dart';
import 'visibility_notifier.dart';
import 'visibility_notifier_arguments.dart';

TagRenderer visibilityNotifierRenderer() {
  return TagRenderer(
    icon: IconPack.flu_eye_filled,
    tag: 'visibilityNotifier',
    description: TagDescription(
      description: '''
# Visibility notifier

Another logical widget / tag that allows you to send / handle events that occur at the moment of its creation (appearance on the screen) and/or at the moment of its destruction (disappearance from the screen). It can be useful for building analytical events related to tracking the appearance of elements on the screen, as well as for triggering more specific functions.
      ''',
      arguments: [
        stringArg('onShow', 'The event that will be passed to the event handler when this widget appears on the screen.'),
        stringArg('onHide', 'The event that will be passed to the event handler when this widget disappears from the screen.'),
      ],
      properties: [],
    ),
    example: '''
<safeArea/>
<visibilityNotifier onHide="snackbar: Green container destroyed" onShow="snackbar: Green container created">
  <padding left="8" right="8" bottom="16">
    <container color="green" height="100" width="250"/>
  </padding>
</visibilityNotifier>
<for in="{{ 0...30 }}">
  <padding left="8" right="8" bottom="16">
    <container color="blue" height="100" width="250"/>
  </padding>
</for>
<visibilityNotifier onHide="snackbar: Red container destroyed" onShow="snackbar: Red container created">
  <padding left="8" right="8" bottom="16">
    <container color="red" height="100" width="250"/>
  </padding>
</visibilityNotifier>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final VisibilityNotifierArguments arguments = VisibilityNotifierArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final Widget child = compactWidgets(extractor.children);

      if (arguments.isEmpty) {
        return child;
      }

      return VisibilityNotifier(
        onShow: arguments.onShow == null ? null : handleClick(context, arguments.onShow),
        onHide: arguments.onHide == null ? null : handleClick(context, arguments.onHide),
        child: child,
      );
    },
  );
}
