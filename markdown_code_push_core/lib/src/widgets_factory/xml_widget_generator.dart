import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_code_push_core/src/widgets_factory/xml_node_extensions.dart';
import 'package:markdown_code_push_core/src/xml_parser/xml_parser_expo.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:xml/xml.dart';

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
      output.add(nodeWidget);
    }
  }

  List<Widget> generate() {
    final List<Widget> widgets = [];
    final XmlNode node = parseXmlSync(data);
    final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
    final List<XmlNode> widgetTags = rootElement.children.toList();
    final List<md.Node> nodes = widgetTags.toMarkdownNodes();

    for (final md.Node node in nodes) {
      final Widget? nodeWidget = _buildWidget(node);
      if (nodeWidget != null) {
        if (widgetsFilter == null) {
          _defaultWidgetsFilter(nodeWidget, widgets);
        } else {
          widgetsFilter!(nodeWidget, widgets);
        }
      }
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
