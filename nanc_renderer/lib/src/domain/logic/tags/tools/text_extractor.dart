import 'package:flutter/material.dart';
import 'package:tag_converter/tag_converter.dart';
import 'package:tools/tools.dart';

import '../logic/substitutor.dart';
import '../renderers/component/element_hash_extension.dart';

List<String> extractTextFromChildren(BuildContext context, WidgetTag element, {bool skipEmptyLines = true}) {
  final List<String> content = [];
  _collectContent(context, element, element.contentHash, content, true, skipEmptyLines);
  return content;
}

List<String> extractTextFromChild(BuildContext context, WidgetTag element, {bool skipEmptyLines = true}) {
  final List<String> content = [];
  for (final TagNode node in element.children) {
    _collectContent(context, node, element.contentHash, content, false, skipEmptyLines);
  }
  return content;
}

void _collectContent(BuildContext context, TagNode node, String hash, List<String> content, bool recursive, bool skipEmptyLines) {
  final RegExp indentRegExp = RegExp(r' *\\');

  if (node is WidgetTag && recursive) {
    for (final TagNode node in node.children) {
      _collectContent(context, node, hash, content, recursive, skipEmptyLines);
    }
  } else if (node is TextNode) {
    final List<String> lines = splitTextByLines(node.text);
    final Substitutor substitutor = Substitutor(context: context);
    for (final String line in lines) {
      String newLine = line.trim().replaceAll(indentRegExp, '');
      final bool haveExpression = substitutor.haveExpression(newLine);
      if (haveExpression) {
        newLine = substitutor.substitute(hash, newLine);
      }
      if (skipEmptyLines && newLine.isNotEmpty) {
        content.add(newLine);
      }
    }
  }
}
