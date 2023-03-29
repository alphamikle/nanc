import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

WidgetConfig createRichWidgetConfig({
  required BuildContext context,
  required RichRenderer richRenderer,
}) {
  return WidgetConfig(
    custom: richRenderer.builders.map(
      (Tag tag, TagRenderer renderer) => MapEntry(
        tag,
        (md.Element node) async {
          final md.Element newNode = await Substitutor.enrichElement(context: context, node: node);
          // ignore: use_build_context_synchronously
          final Widget? child = await renderer.builder(context, newNode, richRenderer);
          if (child != null) {
            return child;
          }
          return null;
        },
      ),
    ),
  );
}
