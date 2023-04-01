import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/logic/substitutor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/for/for_widget_filter.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tags_collection.dart';
import 'package:tools/tools.dart';

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
