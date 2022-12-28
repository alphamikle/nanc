import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer unknownRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'unknown',
    pattern: RegExp(r'.*'),
    endPattern: null,
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      return const SizedBox(
        height: 50,
        child: Text(
          'Unknown',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    },
  );
}
