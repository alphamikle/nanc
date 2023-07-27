import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../documentation/documentation.dart';
import '../../logic/local_data.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import 'data_arguments.dart';

TagRenderer dataRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_code_json,
    tagType: TagType.other,
    tag: 'data',
    description: TagDescription(
      description: '''
# Data

Data - is a special tag, which allows you to store...the data! Who would think that? It may be helpful, for example, if you have some reusable param, which need in many places of your UI.

Data consumes one required argument "id" and any another arguments, which you want. See example code for more info.
''',
      arguments: [
        idArgument(),
        anyArgument(),
      ],
      properties: [],
    ),
    example: '''
<data id="gap" left="16" top="12" right="16" bottom="32"/>

<container width="300" height="500" color="#457FDA">
  <prop:padding left="{{ data(gap).left }}" top="{{ data(gap).top }}" right="{{ data(gap).right }}" bottom="{{ data(gap).bottom }}"/>
  <container color="#7BDA45">
    <prop:padding left="{{ data(gap).left }}" top="{{ data(gap).top }}" right="{{ data(gap).right }}" bottom="{{ data(gap).bottom }}"/>
    <container color="#457FDA">
      <prop:padding left="{{ data(gap).left }}" top="{{ data(gap).top }}" right="{{ data(gap).right }}" bottom="{{ data(gap).bottom }}"/>
      <container color="#7BDA45">
        <prop:padding left="{{ data(gap).left }}" top="{{ data(gap).top }}" right="{{ data(gap).right }}" bottom="{{ data(gap).bottom }}"/>
        <container color="#457FDA">
          <prop:padding left="{{ data(gap).left }}" top="{{ data(gap).top }}" right="{{ data(gap).right }}" bottom="{{ data(gap).bottom }}"/>
          <container color="#7BDA45">
            <prop:padding left="{{ data(gap).left }}" top="{{ data(gap).top }}" right="{{ data(gap).right }}" bottom="{{ data(gap).bottom }}"/>
          </container>
        </container>
      </container>
    </container>
  </container>
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
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
