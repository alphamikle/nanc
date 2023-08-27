import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/widgets_compactor.dart';
import '../sliver_app_bar/sliver_app_bar_renderer.dart';
import 'alias_arguments.dart';
import 'alias_widget.dart';

const String kAliasTag = 'alias';
const String kAliasName = 'name';

TagRenderer aliasRenderer() {
  return TagRenderer(
    icon: IconPack.flu_box_multiple_search_regular,
    tagType: TagType.widget,
    tag: kAliasTag,
    description: TagDescription(
      description: '''
# Alias

A special widget used to retrieve named argument widgets.
For example, `SliverAppBar` widget has several named widget descendants: `title`, `leading` etc.
To be able to get a specific widget by its name-location, we need the `alias` tag.
Also, you can specify several aliases with the same name and then retrieve them all, in this case you will get a list of widgets.
For more clarity, take a look at the examples.
      ''',
      arguments: [
        stringArgument(name: kAliasName),
      ],
      properties: [],
    ),
    example: sliverAppBarRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final AliasArguments arguments = AliasArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (extractor.children.isEmpty || arguments.name == null || arguments.name!.isEmpty) {
        return null;
      }

      return AliasWidget(
        name: arguments.name!,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
