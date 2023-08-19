import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/widgets_compactor.dart';
import 'visibility_notifier.dart';
import 'visibility_notifier_arguments.dart';

TagRenderer visibilityNotifierRenderer() {
  return TagRenderer(
    icon: IconPack.flu_eye_filled,
    tagType: TagType.widget,
    tag: 'visibilityNotifier',
    description: TagDescription(
      description: '''
# Visibility notifier

Another logical widget / tag that allows you to send / handle events that occur at the moment of its creation (appearance on the screen) and/or at the moment of its destruction (disappearance from the screen). It can be useful for building analytical events related to tracking the appearance of elements on the screen, as well as for triggering more specific functions.
      ''',
      arguments: [
        eventArgument(name: 'onShow'),
        eventArgument(name: 'onHide'),
        eventArgument(name: 'lifetime'),
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
<for in="{{ 0...15 }}">
  <padding left="8" right="8" bottom="16">
    <container color="blue" height="100" width="250"/>
  </padding>
</for>
<show ifTrue="true">
  <visibilityNotifier lifetime="snackbar: Yellow container was alive">
    <padding left="8" right="8" bottom="16">
      <container color="yellow" height="100" width="250"/>
    </padding>
  </visibilityNotifier>
</show>
<for in="{{ 0...15 }}">
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
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final VisibilityNotifierArguments arguments = VisibilityNotifierArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final Widget child = compactWidgets(extractor.children);

      if (arguments.isEmpty) {
        return child;
      }

      return VisibilityNotifier(
        onShow: handleEvent(context: context, event: arguments.onShow),
        onHide: handleEvent(context: context, event: arguments.onHide),
        lifetime: arguments.lifetime == null
            ? null
            : (int durationMs) async => handleEvent(
                  context: context,
                  event: arguments.lifetime,
                  meta: {
                    'duration_ms': durationMs,
                  },
                )?.call(),
        child: child,
      );
    },
  );
}
