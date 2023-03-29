import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/logic/substitutor.dart';
import 'package:rich_renderer/src/renderers/component/element_hash_extension.dart';
import 'package:tools/tools.dart';

Future<List<String>> extractTextFromChildren({required BuildContext context, required md.Element element, bool convertToText = false}) async {
  final List<String> content = [];
  await _collectContent(context, element, element.contentHash, content, convertToText);
  return content;
}

Future<void> _collectContent(BuildContext context, md.Node node, String hash, List<String> content, bool convertToText) async {
  if (node is md.Element) {
    for (final md.Node node in node.children ?? []) {
      await _collectContent(context, node, hash, content, convertToText);
    }
  } else {
    final List<String> lines = splitTextByLines(node.textContent);
    final Substitutor substitutor = Substitutor(context: context);
    for (final String line in lines) {
      String newLine = line.trim().replaceAll(r'\', '');
      final bool haveExpression = substitutor.haveExpression(newLine);
      if (haveExpression) {
        newLine = await substitutor.substitute(hash, newLine);
      }
      if (newLine.isNotEmpty) {
        content.add(newLine);
      }
    }
  }
}
