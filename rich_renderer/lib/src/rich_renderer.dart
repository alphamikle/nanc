import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_code_push_core/markdown_code_push_core.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/logic/substitutor.dart';
import 'package:tools/tools.dart';

class RichRenderer {
  RichRenderer({
    required this.widgetConfig,
  });

  final WidgetConfig widgetConfig;

  Map<Tag, TagRenderer> get builders => _builders;
  final Map<Tag, TagRenderer> _builders = {};

  void registerRenderer(TagRenderer renderer) => _builders[renderer.tag] = renderer;

  Widget? render(BuildContext context, md.Element element) {
    try {
      return _builders[element.tag]!.builder(context, element, this);
    } catch (error, stackTrace) {
      logg('Got a error while rendering tag', error, stackTrace);
      return ErrorWidget(error);
    }
  }

  List<Widget> renderChildren(BuildContext context, List<md.Node>? nodes) {
    if (nodes == null) {
      return [];
    }
    final List<Widget> children = [];
    for (final md.Node node in nodes) {
      if (node is md.UnparsedContent) {
        continue;
      }
      if (node is md.Element && isRendererRegistered(node.tag)) {
        final md.Element newNode = Substitutor.enrichElement(context: context, node: node);
        // ignore: use_build_context_synchronously
        final Widget? child = render(context, newNode);
        if (child != null) {
          forWidgetFilter(child, children);
        }
      }
    }
    return children;
  }

  bool isRendererRegistered(String tag) => _builders.containsKey(tag);
}
