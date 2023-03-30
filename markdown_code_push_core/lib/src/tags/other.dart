import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;

import 'package:markdown_code_push_core/src/config/style_config.dart';

///Tag: other --- this is for you to custom widget
InlineSpan getOtherWidgetSpan(m.Element node) => WidgetSpan(child: OtherWidget(node: node));

///the custom widget
class OtherWidget extends StatelessWidget {

  const OtherWidget({
    super.key,
    required this.node,
  });
  final m.Element node;

  @override
  Widget build(BuildContext context) {
    final customWidget = StyleConfig().pConfig?.custom;
    final m.Element customNode = node.children![0] as m.Element;
    if (customWidget != null) {
      return customWidget.call(customNode);
    } else {
      debugPrint('UnCatch Node:${customNode.tag}');
      return Container();
    }
  }
}
