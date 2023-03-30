import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_code_push_core/markdown_code_push_core.dart';
import 'package:markdown_code_push_core/src/widgets_factory/xml_node_extensions.dart';
import 'package:markdown_code_push_core/src/xml_parser/xml_parser_expo.dart';
import 'package:xml/xml.dart';

typedef MarkdownFormatter = String Function(BuildContext context, String rawMarkdown);
typedef WidgetsFilter = void Function(Widget nodeWidget, List<Widget> output);

class MarkdownGeneratorV2 {
  MarkdownGeneratorV2({
    required this.context,
    required this.data,
    this.widgetConfig,
    this.widgetsFilter,
  });

  factory MarkdownGeneratorV2.old({
    required BuildContext context,
    required String data,
    WidgetConfig? widgetConfig,
    WidgetsFilter? widgetsFilter,
    StyleConfig? styleConfig,
    List<md.BlockSyntax>? blockSyntaxes,
  }) {
    return MarkdownGenerator(
      context: context,
      data: data,
      widgetConfig: widgetConfig,
      widgetsFilter: widgetsFilter,
      styleConfig: styleConfig,
      blockSyntaxes: blockSyntaxes ?? [],
      formatters: [],
      inlineSyntaxes: [],
    );
  }

  final BuildContext context;
  final String data;
  final WidgetConfig? widgetConfig;
  final WidgetsFilter? widgetsFilter;
  late final WidgetConfig effectiveWidgetConfig = widgetConfig ?? WidgetConfig();

  void _defaultWidgetsFilter(Widget? nodeWidget, List<Widget> output) {
    if (nodeWidget != null) {
      output.add(nodeWidget);
    }
  }

  Future<List<Widget>> generate() async {
    final List<Widget> widgets = [];
    final XmlNode node = await parseXml(data);
    final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
    final List<XmlNode> widgetTags = rootElement.children.toList();
    final List<md.Node> nodes = widgetTags.toMarkdownNodes();

    for (final md.Node node in nodes) {
      final Widget? nodeWidget = await _buildWidget(node);
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

  Future<Widget?> _buildWidget(md.Node node) async {
    if (node is md.Text || node is md.UnparsedContent) {
      return null;
    }
    final String tag = (node as md.Element).tag;
    if (effectiveWidgetConfig.builderForTag(tag) != null) {
      return effectiveWidgetConfig.builderForTag(tag)!(node);
    }
    return null;
  }
}
