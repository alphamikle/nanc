import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../model/tag.dart';
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
      logg('Got a error while rendering tag', error, stackTrace);
      return ErrorWidget(error);
    }
  }

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
