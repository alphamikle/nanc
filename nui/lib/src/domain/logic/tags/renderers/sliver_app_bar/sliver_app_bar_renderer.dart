import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nui.dart';
import '../../tools/properties_names.dart';
import 'sliver_app_bar_arguments.dart';

TagRenderer sliverAppBarRenderer() {
  return TagRenderer(
    icon: IconPack.flu_phone_status_bar_filled,
    tagType: TagType.sliver,
    availableNuiWidget: AvailableNuiWidget.scrollable,
    tag: 'sliverAppBar',
    description: TagDescription(
      description: '''
# [Sliver App Bar](https://api.flutter.dev/flutter/material/SliverAppBar-class.html)

A Material Design app bar that integrates with a [CustomScrollView](widgets/CustomScrollView-class.html).

An app bar consists of a toolbar and potentially other widgets, such as a [TabBar](material/TabBar-class.html) and a [FlexibleSpaceBar](material/FlexibleSpaceBar-class.html). App bars typically expose one or more common actions with [IconButton](material/IconButton-class.html)s which are optionally followed by a [PopupMenuButton](material/PopupMenuButton-class.html) for less common operations.

Sliver app bars are typically used as the first child of a [CustomScrollView](widgets/CustomScrollView-class.html), which lets the app bar integrate with the scroll view so that it can vary in height according to the scroll offset or float above the other content in the scroll view. For a fixed-height app bar at the top of the screen see [AppBar](material/AppBar-class.html), which is used in the [Scaffold.appBar](material/Scaffold/appBar.html) slot.

The AppBar displays the toolbar widgets, [leading](material/SliverAppBar/leading.html), [title](material/SliverAppBar/title.html), and [actions](material/SliverAppBar/actions.html), above the [bottom](material/SliverAppBar/bottom.html) (if any). If a [flexibleSpace](material/SliverAppBar/flexibleSpace.html) widget is specified then it is stacked behind the toolbar and the bottom widget.
''',
      arguments: [
        boolArgument(name: 'floating'),
        boolArgument(name: 'pinned'),
        colorArgument(name: 'backgroundColor'),
        colorArgument(name: 'shadowColor'),
        colorArgument(name: 'surfaceTintColor'),
        doubleArgument(name: 'elevation'),
        boolArgument(name: 'autoLeading'),
        boolArgument(name: 'centerTitle'),
        doubleArgument(name: 'collapsedHeight'),
        doubleArgument(name: 'expandedHeight'),
        boolArgument(name: 'forceElevated'),
        boolArgument(name: 'forceMaterialTransparency'),
        colorArgument(name: 'foregroundColor'),
        doubleArgument(name: 'leadingWidth'),
        boolArgument(name: 'snap'),
        boolArgument(name: 'stretch'),
        eventArgument(name: 'onStretchTrigger'),
        doubleArgument(name: 'scrolledUnderElevation'),
        doubleArgument(name: 'stretchTriggerOffset'),
        doubleArgument(name: 'titleSpacing'),
        doubleArgument(name: 'toolbarHeight'),
      ],
      properties: [
        borderProp(name: shape),
        systemOverlayProp(name: systemOverlayStyle),
        textStyleProp(name: titleTextStyle),
        textStyleProp(name: toolbarTextStyle),
        iconStyleProp(name: iconTheme),
        iconStyleProp(name: actionsIconTheme),
      ],
      aliases: [
        const TagAlias(
          name: 'bottom',
          values: {'PreferredSizeWidget', '<preferredSize/>'},
          description: '''
This widget appears across the bottom of the app bar. Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can be used at the bottom of an app bar.
''',
        ),
        const TagAlias(name: 'title', description: '''
The primary widget displayed in the app bar. Becomes the middle component of the [NavigationToolbar] built by this widget.
Typically a [Text] widget that contains a description of the current contents of the app.
'''),
        const TagAlias(name: 'leading', description: '''
A widget to display before the toolbar's [title]. Typically the [leading] widget is an [Icon] or an [IconButton].
'''),
        const TagAlias(name: 'actions', multiple: true, description: '''
A list of Widgets to display in a row after the [title] widget.

Typically these widgets are [IconButton]s representing common operations.
For less common operations, consider using a [PopupMenuButton] as the last action.

The [actions] become the trailing component of the [NavigationToolbar] built by this widget. The height of each action is constrained to be no bigger than the [toolbarHeight].
'''),
        const TagAlias(name: 'flexibleSpace', description: '''
This widget is stacked behind the toolbar and the tab bar. Its height will be the same as the app bar's overall height.

A flexible space isn't actually flexible unless the [AppBar]'s container changes the [AppBar]'s size. A [SliverAppBar] in a [CustomScrollView] changes the [AppBar]'s height when scrolled.

Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
''', values: {'FlexibleSpaceBar', '<flexibleSpaceBar/>'}),
      ],
    ),
    example: '''
<sliverAppBar floating="true" stretch="true" onStretchTrigger="snackbar: Stretched" expandedHeight="100">
  <alias name="title">
    <text color="white">
      Nanc App
    </text>
  </alias>
  <alias name="flexibleSpace">
    <flexibleSpaceBar blurBackground="true" zoomBackground="true" fadeTitle="true">
      <alias name="background">
        <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg" useCache="false" fit="cover"/>
      </alias>
    </flexibleSpaceBar>
  </alias>
</sliverAppBar>

<sizedBox height="8"/>

<for to="10">
  <padding left="8" right="8" bottom="8">
    <container height="50" color="#80FF0000"/>
  </padding>
  <padding left="8" right="8" bottom="8">
    <container height="50" color="#8000FF24"/>
  </padding>
  <padding left="8" right="8" bottom="8">
    <container height="50" color="#8021A0E6"/>
  </padding>
</for>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SliverAppBarArguments arguments = SliverAppBarArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final Widget? bottomWidget = extractor.getAlias('bottom');
      final Widget? flexibleSpace = extractor.getAlias('flexibleSpace');

      return SliverAppBar(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        floating: arguments.floating ?? false,
        pinned: arguments.pinned ?? false,
        bottom: bottomWidget is PreferredSizeWidget ? bottomWidget : null,
        title: extractor.getAlias('title'),
        backgroundColor: arguments.backgroundColor,
        shadowColor: arguments.shadowColor,
        surfaceTintColor: arguments.surfaceTintColor,
        shape: extractor.getProperty(shape),
        elevation: arguments.elevation,
        leading: extractor.getAlias('leading'),
        actions: extractor.getAliases('actions'),
        automaticallyImplyLeading: arguments.autoLeading ?? true,
        centerTitle: arguments.centerTitle,
        collapsedHeight: arguments.collapsedHeight,
        expandedHeight: arguments.expandedHeight,
        flexibleSpace: flexibleSpace is FlexibleSpaceBar ? flexibleSpace : null,
        forceElevated: arguments.forceElevated ?? false,
        forceMaterialTransparency: arguments.forceMaterialTransparency ?? false,
        foregroundColor: arguments.foregroundColor,
        leadingWidth: arguments.leadingWidth,
        snap: arguments.snap ?? false,
        stretch: arguments.stretch ?? false,
        onStretchTrigger: handleEvent(context: context, event: arguments.onStretchTrigger),
        scrolledUnderElevation: arguments.scrolledUnderElevation,
        stretchTriggerOffset: arguments.stretchTriggerOffset ?? 100,
        systemOverlayStyle: extractor.getProperty(systemOverlayStyle),
        titleSpacing: arguments.titleSpacing,
        titleTextStyle: extractor.getProperty(titleTextStyle),
        toolbarHeight: arguments.toolbarHeight ?? kToolbarHeight,
        toolbarTextStyle: extractor.getProperty(toolbarTextStyle),
        iconTheme: extractor.getProperty(iconTheme),
        actionsIconTheme: extractor.getProperty(actionsIconTheme),
      );
    },
  );
}
