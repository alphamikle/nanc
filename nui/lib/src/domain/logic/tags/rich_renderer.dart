import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui_converter/nui_converter.dart';

import 'logic/substitutor.dart';
import 'renderers/for/for_widget_filter.dart';
import 'tag_renderer.dart';
import 'tags_collection.dart';

class RichRenderer {
  RichRenderer({
    required Iterable<TagRenderer> renderers,
  }) {
    renderers.forEach(registerRenderer);
    TagsCollection.renderers.forEach(registerRenderer);
  }

  Map<Tag, TagRenderer> get builders => _builders;
  final Map<Tag, TagRenderer> _builders = {};

  void registerRenderer(TagRenderer renderer) => _builders[renderer.tag] = renderer;

  Widget? render(BuildContext context, WidgetTag node) {
    try {
      final WidgetTag richNode = Substitutor.enrichElement(context: context, node: node);
      return _builders[richNode.tag]!.builder(context, richNode, this);
    } catch (error, stackTrace) {
      logError('Got a error while rendering tag', error: error, stackTrace: stackTrace);
      return ErrorWidget(error);
    }
  }

  bool isSliver(WidgetTag node) => _builders[node.tag]?.tagType.isSliver ?? false;

  List<Widget> renderChildren(BuildContext context, List<TagNode>? nodes) {
    if (nodes == null) {
      return [];
    }
    final List<Widget> children = [];
    for (final TagNode node in nodes) {
      if (node is UnknownNode || node is TextNode) {
        continue;
      }
      if (node is WidgetTag && isRendererRegistered(node.tag)) {
        final Widget? child = render(context, node);
        if (child != null) {
          forWidgetFilter(child, children);
        }
      }
    }
    return children;
  }

  bool isRendererRegistered(String tag) => _builders.containsKey(tag);
}
