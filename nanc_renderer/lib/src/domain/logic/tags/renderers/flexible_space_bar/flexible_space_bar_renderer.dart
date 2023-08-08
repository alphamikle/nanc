import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../sliver_app_bar/sliver_app_bar_renderer.dart';
import 'flexible_space_bar_arguments.dart';

TagRenderer flexibleSpaceBarRenderer() {
  return TagRenderer(
    icon: IconPack.flu_panel_left_expand_filled,
    tagType: TagType.widget,
    availableNuiWidget: AvailableNuiWidget.scrollable,
    tag: 'flexibleSpaceBar',
    description: TagDescription(
      description: '''
# [Flexible Space Bar]()


      ''',
      arguments: [
        boolArgument(name: 'centerTitle'),
        collapseModeArgument(name: 'collapseMode'),
        doubleArgument(name: 'expandedTitleScale'),
        boolArgument(name: 'blurBackground'),
        boolArgument(name: 'fadeTitle'),
        boolArgument(name: 'zoomBackground'),
      ],
      properties: [
        paddingProp(),
      ],
      aliases: const [
        TagAlias(name: 'title'),
        TagAlias(name: 'background'),
      ],
    ),
    example: sliverAppBarRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final FlexibleSpaceBarArguments arguments = FlexibleSpaceBarArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final bool blurBackground = arguments.blurBackground ?? false;
      final bool fadeTitle = arguments.fadeTitle ?? false;
      final bool zoomBackground = arguments.zoomBackground ?? false;
      final bool hasNoAnyMode = blurBackground == false && fadeTitle == false && zoomBackground == false;

      return FlexibleSpaceBar(
        centerTitle: arguments.centerTitle,
        collapseMode: arguments.collapseMode ?? CollapseMode.parallax,
        expandedTitleScale: arguments.expandedTitleScale ?? 1.5,
        stretchModes: [
          if (blurBackground) StretchMode.blurBackground,
          if (fadeTitle) StretchMode.fadeTitle,
          if (zoomBackground) StretchMode.zoomBackground,
          if (hasNoAnyMode) StretchMode.zoomBackground,
        ],
        titlePadding: extractor.getProperty(padding),
        title: extractor.getAlias('title'),
        background: extractor.getAlias('background'),
      );
    },
  );
}
