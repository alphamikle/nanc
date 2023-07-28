import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';

TagRenderer unknownRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_timeline_question_outline,
    tagType: TagType.widget,
    tag: 'unknown',
    description: const TagDescription.empty(),
    example: '''
TODO
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
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
