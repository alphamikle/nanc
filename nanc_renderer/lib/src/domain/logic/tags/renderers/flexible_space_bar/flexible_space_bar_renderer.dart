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
# [Flexible Space Bar](https://api.flutter.dev/flutter/material/FlexibleSpaceBar-class.html)

The part of a Material Design [AppBar](material/AppBar-class.html) that expands, collapses, and stretches.

Most commonly used in the [SliverAppBar.flexibleSpace](material/SliverAppBar/flexibleSpace.html) field, a flexible space bar expands and contracts as the app scrolls so that the [AppBar](material/AppBar-class.html) reaches from the top of the app to the top of the scrolling contents of the app. When using [SliverAppBar.flexibleSpace](material/SliverAppBar/flexibleSpace.html), the [SliverAppBar.expandedHeight](material/SliverAppBar/expandedHeight.html) must be large enough to accommodate the [SliverAppBar.flexibleSpace](material/SliverAppBar/flexibleSpace.html) widget.

Furthermore is included functionality for stretch behavior. When [SliverAppBar.stretch](material/SliverAppBar/stretch.html) is true, and your [ScrollPhysics](widgets/ScrollPhysics-class.html) allow for overscroll, this space will stretch with the overscroll.
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
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
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
