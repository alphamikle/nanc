import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import 'spacer_arguments.dart';

TagRenderer spacerRenderer() {
  return TagRenderer(
    icon: IconPack.flu_spacebar_filled,
    tagType: TagType.widget,
    tag: 'spacer',
    description: TagDescription(
      description: '''
# [Spacer](https://api.flutter.dev/flutter/widgets/Spacer-class.html)

Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a [Flex](widgets/Flex-class.html) container, like [Row](widgets/Row-class.html) or [Column](widgets/Column-class.html).

The [Spacer](widgets/Spacer-class.html) widget will take up any available space, so setting the [Flex.mainAxisAlignment](widgets/Flex/mainAxisAlignment.html) on a flex container that contains a [Spacer](widgets/Spacer-class.html) to [MainAxisAlignment.spaceAround](rendering/MainAxisAlignment.html), [MainAxisAlignment.spaceBetween](rendering/MainAxisAlignment.html), or [MainAxisAlignment.spaceEvenly](rendering/MainAxisAlignment.html) will not have any visible effect: the [Spacer](widgets/Spacer-class.html) has taken up all of the additional space, therefore there is none left to redistribute.
      ''',
      arguments: [
        flexArgument(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <sizedBox height="50">
    <row>
      <container height="50" width="50" color="red"/>
      <spacer/>
      <container height="50" width="50" color="blue"/>
    </row>
  </sizedBox>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SpacerArguments arguments = SpacerArguments.fromJson(element.attributes);

      return Spacer(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        flex: arguments.flex ?? 1,
      );
    },
  );
}
