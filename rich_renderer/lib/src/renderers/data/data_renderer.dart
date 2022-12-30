import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/data/data_arguments.dart';

TagRenderer dataRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_code_json,
    tag: 'data',
    pattern: RegExp(r'<data.*/>'),
    endPattern: null,
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final DataArguments arguments = DataArguments.fromJson(element.attributes);

      if (arguments.id != null && arguments.id!.isNotEmpty) {
        final LocalData localDataStorage = LocalData.of(context);
        for (final MapEntry<ValueId, String> attributeEntry in element.attributes.entries) {
          localDataStorage.setValue(
            dataId: arguments.id!,
            valueId: attributeEntry.key,
            value: attributeEntry.value,
          );
        }
      }

      return null;
    },
  );
}
