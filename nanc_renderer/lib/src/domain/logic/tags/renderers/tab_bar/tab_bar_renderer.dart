// import 'package:flutter/material.dart';
// import 'package:icons/icons.dart';
//
// import '../../../model/tag.dart';
// import '../../rich_renderer.dart';
// import '../../tag_description.dart';
// import '../../tag_renderer.dart';
// import '../../tools/properties_extractor.dart';
//
// import 'tab_bar_arguments.dart';
//
// TagRenderer tabBarRenderer() {
//   return TagRenderer(
//     icon: IconPack.flu_tab_desktop_regular,
//     tagType: TagType.widget,
//     availableNuiWidget: AvailableNuiWidget.scrollable,
//     tag: 'tabBar',
//     description: TagDescription(
//       description: '''
// # [Tab Bar]()
//       ''',
//       arguments: [
//         // TODO(alphamikle): arguments docs
//       ],
//       properties: [
//         // TODO(alphamikle): properties docs
//       ],
//     ),
//     example: '''
// TODO
// ''',
//     builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
//       final TabBarArguments arguments = TabBarArguments.fromJson(element.attributes);
//       final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
//
//       return TabBar(
//         tabs: extractor.children,
//       );
//     },
//   );
// }
