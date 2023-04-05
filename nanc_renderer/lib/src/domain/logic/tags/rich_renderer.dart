import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:tools/tools.dart';

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

  Widget? render(BuildContext context, md.Element element) {
    try {
      final md.Element richNode = Substitutor.enrichElement(context: context, node: element);
      return _builders[richNode.tag]!.builder(context, richNode, this);
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
      if (node is md.UnparsedContent || node is md.Text) {
        continue;
      }
      if (node is md.Element && isRendererRegistered(node.tag)) {
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
