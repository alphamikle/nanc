import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../tags/renderers/for/for_widget.dart';
import '../tags/renderers/for/for_widget_filter.dart';
import '../tags/rich_renderer.dart';

typedef MarkdownFormatter = String Function(BuildContext context, String rawMarkdown);
typedef WidgetsFilter = void Function(Widget nodeWidget, List<Widget> output);
typedef GeneratorResult = (List<Widget> widgets, bool hasSlivers);

class XmlWidgetGenerator {
  XmlWidgetGenerator({
    required BuildContext context,
    required String? data,
    required List<TagNode>? nodes,
    required Uint8List? binary,
    required RichRenderer richRenderer,
    void Function(Widget, List<Widget>)? widgetsFilter,
  })  : assert(data != null || nodes != null || binary != null),
        _widgetsFilter = widgetsFilter,
        _richRenderer = richRenderer,
        _binary = binary,
        _nodes = nodes,
        _data = data,
        _context = context;

  XmlWidgetGenerator.xml({
    required BuildContext context,
    required String data,
    required RichRenderer richRenderer,
    void Function(Widget, List<Widget>)? widgetsFilter,
  })  : _widgetsFilter = widgetsFilter,
        _richRenderer = richRenderer,
        _nodes = null,
        _data = data,
        _context = context,
        _binary = null;

  XmlWidgetGenerator.nodes({
    required BuildContext context,
    required List<TagNode> nodes,
    required RichRenderer richRenderer,
    void Function(Widget, List<Widget>)? widgetsFilter,
  })  : _widgetsFilter = widgetsFilter,
        _richRenderer = richRenderer,
        _data = null,
        _nodes = nodes,
        _context = context,
        _binary = null;

  XmlWidgetGenerator.binary({
    required BuildContext context,
    required Uint8List binary,
    required RichRenderer richRenderer,
    void Function(Widget, List<Widget>)? widgetsFilter,
  })  : _widgetsFilter = widgetsFilter,
        _richRenderer = richRenderer,
        _data = null,
        _nodes = null,
        _binary = binary,
        _context = context;

  @visibleForTesting
  XmlWidgetGenerator.test({
    required String? data,
    required List<TagNode>? nodes,
    required Uint8List? binary,
    required RichRenderer richRenderer,
  })  : assert(data != null || nodes != null || binary != null),
        _richRenderer = richRenderer,
        _binary = binary,
        _nodes = nodes,
        _data = data,
        _context = null,
        _widgetsFilter = null;

  final BuildContext? _context;
  final String? _data;
  final List<TagNode>? _nodes;
  final Uint8List? _binary;
  final RichRenderer _richRenderer;
  final WidgetsFilter? _widgetsFilter;

  bool get _isTest => kDebugMode && _context == null;

  GeneratorResult generate() {
    final List<Widget> widgets = [];
    final List<TagNode> nodes = _nodes ?? (_binary != null ? TagsConverter.fromBinary(_binary) : TagsConverter.fromXml(_data!));

    bool hasSlivers = false;

    for (final TagNode node in nodes) {
      final (Widget? widget, bool isSliver) = _buildWidget(node);
      if (hasSlivers == false && isSliver) {
        hasSlivers = true;
      }
      _defaultWidgetsFilter(widget, widgets);
    }
    return (widgets, hasSlivers);
  }

  Future<GeneratorResult> generateAsync() async {
    throw UnimplementedError('Not implemented yet!');
    // final Stopwatch stopwatch = Stopwatch()..start();
    // final List<Widget> widgets = [];
    // late final XmlNode node;
    // try {
    //   node = parseXmlSync(data);
    // } catch (error, stackTrace) {
    //   logError('Error on generating widgets from the XML', error: error, stackTrace: stackTrace);
    //   return (<Widget>[], false);
    // }
    // final XmlElement rootElement = node.children.firstWhere((XmlNode it) => it is XmlElement && it.localName == kRootNode) as XmlElement;
    // final List<TagNode> nodes = await rootElement.children.toTagNodesAsync();
    // bool hasSlivers = false;
    //
    // for (final TagNode node in nodes) {
    //   if (Delayer.needToPause(pauseEveryCycles: 13)) {
    //     await Delayer.pause();
    //   }
    //   final (Widget? widget, bool isSliver) = _buildWidget(node);
    //   if (hasSlivers == false && isSliver) {
    //     hasSlivers = true;
    //   }
    //   await _defaultWidgetsAsyncFilter(widget, widgets);
    // }
    // stopwatch.stop();
    // logInfo('Time for asynchronous widgets generation: ${stopwatch.elapsedMicroseconds / 1000}ms');
    //
    // return (widgets, hasSlivers);
  }

  void _defaultWidgetsFilter(Widget? nodeWidget, List<Widget> output) {
    if (nodeWidget != null) {
      forWidgetFilter(nodeWidget, output);
    }
    if (_widgetsFilter != null && nodeWidget != null && nodeWidget is! ForWidget) {
      _widgetsFilter(nodeWidget, output);
    }
  }

  // Future<void> _defaultWidgetsAsyncFilter(Widget? nodeWidget, List<Widget> output) async {
  //   if (nodeWidget != null) {
  //     await forWidgetAsyncFilter(nodeWidget, output);
  //   }
  //   if (_widgetsFilter != null && nodeWidget != null && nodeWidget is! ForWidget) {
  //     _widgetsFilter(nodeWidget, output);
  //   }
  // }

  (Widget? widget, bool isSliver) _buildWidget(TagNode node) {
    if (_isTest) {
      return (const SizedBox(), false);
    }

    return switch (node) {
      TextNode() => (null, false),
      UnknownNode() => (null, false),
      PropertyTag(tag: final String tag) => (_richRenderer.isRendererRegistered(tag) ? _richRenderer.render(_context!, node) : null, false),
      WidgetTag(tag: final String tag) => (
          _richRenderer.isRendererRegistered(tag) ? _richRenderer.render(_context!, node) : null,
          _richRenderer.isSliver(node)
        ),
    };
  }
}
