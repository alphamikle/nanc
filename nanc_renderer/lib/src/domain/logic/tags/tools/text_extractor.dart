import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../model/tag.dart';
import '../logic/substitutor.dart';
import '../renderers/component/element_hash_extension.dart';

List<String> extractTextFromChildren({required BuildContext context, required WidgetTag element, bool convertToText = false}) {
  final List<String> content = [];
  _collectContent(context, element, element.contentHash, content, convertToText);
  return content;
}

void _collectContent(BuildContext context, TagNode node, String hash, List<String> content, bool convertToText) {
  if (node is WidgetTag) {
    for (final TagNode node in node.children) {
      _collectContent(context, node, hash, content, convertToText);
    }
  } else if (node is TextNode) {
    final List<String> lines = splitTextByLines(node.text);
    final Substitutor substitutor = Substitutor(context: context);
    for (final String line in lines) {
      String newLine = line.trim().replaceAll(r'\', '');
      final bool haveExpression = substitutor.haveExpression(newLine);
      if (haveExpression) {
        newLine = substitutor.substitute(hash, newLine);
      }
      if (newLine.isNotEmpty) {
        content.add(newLine);
      }
    }
  }
}
