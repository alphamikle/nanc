import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';

TagRenderer unknownRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_timeline_question_outline,
    tag: 'unknown',
    pattern: RegExp(r'.*'),
    endPattern: null,
    description: const TagDescription.empty(),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
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
