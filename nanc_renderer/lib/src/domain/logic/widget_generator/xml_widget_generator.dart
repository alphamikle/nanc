import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:xml/xml.dart';

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

  List<Widget> generate() {
    final List<Widget> widgets = [];
    late final XmlNode node;
    try {
      node = parseXmlSync(data);
    } catch (error) {
      return [];
    }
    final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
    final List<XmlNode> widgetTags = rootElement.children.toList();
    final List<md.Node> nodes = widgetTags.toMarkdownNodes();

    for (final md.Node node in nodes) {
      _defaultWidgetsFilter(_buildWidget(node), widgets);
    }
    return widgets;
  }

  Widget? _buildWidget(md.Node node) {
    if (node is md.Text || node is md.UnparsedContent) {
      return null;
    }
    final String tag = (node as md.Element).tag;
    if (richRenderer.isRendererRegistered(tag)) {
      return richRenderer.render(context, node);
    }
    return null;
  }
}
