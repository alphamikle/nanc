import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:xml/xml.dart';

import '../model/tag.dart';
import '../tags/renderers/for/for_widget.dart';
import '../tags/renderers/for/for_widget_filter.dart';
import '../tags/rich_renderer.dart';
import '../xml_parser/xml_parser_expo.dart';
import 'xml_node_extensions.dart';

typedef MarkdownFormatter = String Function(BuildContext context, String rawMarkdown);
typedef WidgetsFilter = void Function(Widget nodeWidget, List<Widget> output);

class XmlWidgetGenerator {
  XmlWidgetGenerator({
    required this.context,
    required this.data,
    required this.richRenderer,
    this.widgetsFilter,
  });

  final BuildContext context;
  final String data;
  final RichRenderer richRenderer;
  final WidgetsFilter? widgetsFilter;

  void _defaultWidgetsFilter(Widget? nodeWidget, List<Widget> output) {
    if (nodeWidget != null) {
      forWidgetFilter(nodeWidget, output);
    }
    if (widgetsFilter != null && nodeWidget != null && nodeWidget is! ForWidget) {
      widgetsFilter!(nodeWidget, output);
    }
  }

  (List<Widget> widgets, bool hasSlivers) generate() {
    final Stopwatch stopwatch = Stopwatch()..start();
    final List<Widget> widgets = [];
    late final XmlNode node;
    try {
      node = parseXmlSync(data);
    } catch (error, stackTrace) {
      logError('Error on generating widgets from the XML', error: error, stackTrace: stackTrace);
      return ([], false);
    }
    final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
    final List<XmlNode> widgetTags = rootElement.children.toList();
    final List<TagNode> nodes = widgetTags.toTagNodes();
    bool hasSlivers = false;

    for (final TagNode node in nodes) {
      final (Widget? widget, bool isSliver) = _buildWidget(node);
      if (hasSlivers == false && isSliver) {
        hasSlivers = true;
      }
      _defaultWidgetsFilter(widget, widgets);
    }
    stopwatch.stop();
    logInfo('Time for generate widgets: ${stopwatch.elapsedMicroseconds / 1000}ms');
    return (widgets, hasSlivers);
  }

  (Widget? widget, bool isSliver) _buildWidget(TagNode node) {
    return switch (node) {
      TextNode() => (null, false),
      UnknownNode() => (null, false),
      PropertyTag(tag: final String tag) => (richRenderer.isRendererRegistered(tag) ? richRenderer.render(context, node) : null, false),
      WidgetTag(tag: final String tag) => (richRenderer.isRendererRegistered(tag) ? richRenderer.render(context, node) : null, richRenderer.isSliver(node)),
    };
  }
}
