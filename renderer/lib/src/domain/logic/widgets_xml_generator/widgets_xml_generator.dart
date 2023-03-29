import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renderer/src/domain/logic/widgets_builder/widgets_builder.dart';
import 'package:renderer/src/domain/logic/xml_parser/xml_parser_expo.dart';
import 'package:xml/xml.dart';

typedef WidgetsFilter = void Function(Widget? widget, List<Widget> output);

WidgetsXmlGenerator defaultWidgetsXmlGeneratorFactory(String xml) {
  return WidgetsXmlGenerator(
    xml: xml,
    widgetsBuilder: defaultWidgetsBuilderFactory(),
    // TODO(alphamikle): For-Loop filter
    filter: null,
  );
}

class WidgetsXmlGenerator {
  WidgetsXmlGenerator({
    required this.xml,
    required this.widgetsBuilder,
    this.filter,
  });

  final String xml;
  final WidgetsFilter? filter;
  final WidgetsBuilder widgetsBuilder;

  final List<Widget> _cache = [];
  bool _documentWasCreated = false;
  bool _documentWasParsed = false;
  bool _documentParsingStarted = false;
  late XmlDocument _document;

  Stream<List<Widget>> generate(BuildContext context) async* {
    if (_documentParsingStarted == false) {
      _documentParsingStarted = true;
    } else {
      while (_documentWasParsed == false) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
    }
    if (_documentWasCreated == false) {
      await _createDocument();
    }
    if (_documentWasParsed) {
      yield _cache;
      return;
    }
    final XmlElement rootNode = _document.children.firstWhere(_rootFinder) as XmlElement;
    for (final XmlNode node in rootNode.children) {
      if (node is XmlElement) {
        // ignore: use_build_context_synchronously
        final FutureOr<Widget?> futureOrWidget = _buildWidget(context, node);
        late final Widget? widget;
        if (futureOrWidget is Future) {
          widget = await futureOrWidget;
        } else {
          widget = futureOrWidget;
        }
        if (widget != null) {
          if (filter != null) {
            filter!(widget, _cache);
          } else {
            _cache.add(widget);
          }
          yield _cache;
        }
      }
    }
    _documentWasParsed = true;
    return;
  }

  Future<void> _createDocument() async {
    _document = await parseXml(xml);
    _documentWasCreated = true;
  }

  bool _rootFinder(XmlNode node) {
    if (node is XmlElement && node.name.local == kRootNode) {
      return true;
    }
    return false;
  }

  FutureOr<Widget?> _buildWidget(BuildContext context, XmlElement node) {
    final String tag = node.name.local;
    if (widgetsBuilder.hasTagBuilder(tag)) {
      return widgetsBuilder.build(context, node);
    }
    return null;
  }
}
