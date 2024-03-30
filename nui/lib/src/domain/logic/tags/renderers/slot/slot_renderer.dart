import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../component/component_renderer.dart';

const String kSlotTag = 'slot';
const String kSlotName = 'name';

TagRenderer slotRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_file_replace,
    tagType: TagType.widget,
    tag: kSlotTag,
    description: TagDescription(
      description: '''
# Slot

Slot is a special tag that can only be used inside the `<template>` tag.
It is an "empty space" of the template, which can be filled with some widget/tag, which will be placed inside the `<alias>` tag with the corresponding name, placed inside the `<component>` tag.
For more clarity, take a look at the example.
''',
      arguments: [
        stringArgument(name: kSlotName),
      ],
      properties: [],
    ),
    example: componentRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      return null;
    },
  );
}
