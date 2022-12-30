import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/image/image_arguments.dart';
import 'package:rich_renderer/src/renderers/image/smart_image.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer imageRenderer() {
  return TagRenderer(
    icon: IconPack.box_image,
    tag: 'image',
    pattern: RegExp(r'<image.*/>'),
    endPattern: null,
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ImageArguments arguments = ImageArguments.fromJson(element.attributes);

      if (arguments.ref == null || arguments.ref!.isEmpty) {
        return const SizedBox.shrink();
      }

      return SmartImage(
        ref: arguments.ref!,
        fit: arguments.fit,
        height: arguments.height,
        width: arguments.width,
        color: arguments.color,
      );
    },
  );
}
