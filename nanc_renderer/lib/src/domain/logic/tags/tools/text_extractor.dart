import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/logic/substitutor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/component/element_hash_extension.dart';
import 'package:tools/tools.dart';

List<String> extractTextFromChildren({required BuildContext context, required md.Element element, bool convertToText = false}) {
  final List<String> content = [];
  _collectContent(context, element, element.contentHash, content, convertToText);
  return content;
}

void _collectContent(BuildContext context, md.Node node, String hash, List<String> content, bool convertToText) {
  if (node is md.Element) {
    for (final md.Node node in node.children ?? []) {
      _collectContent(context, node, hash, content, convertToText);
    }
  } else {
    final List<String> lines = splitTextByLines(node.textContent);
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
