import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:ui_kit/ui_kit.dart';

class TagRendererDescription extends StatelessWidget {
  const TagRendererDescription({
    required this.tagName,
    required this.withChildren,
    required this.description,
    super.key,
  });

  final String tagName;
  final bool withChildren;
  final TagDescription description;

  Widget buildArgument(String tagName, TagArgument argument) {
    final List<String> exampleCode = [
      '<$tagName ${argument.name}="${argument.values.join(' | ')}">',
    ];
    if (withChildren) {
      exampleCode.addAll([
        if (description.properties.isNotEmpty) '  <!-- Properties -->',
        '  <!-- Children / child widgets -->',
        '</$tagName>',
      ]);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Gap.regular),
            child: MarkdownBody(data: '### ${argument.name}'),
          ),
          HighlightView(
            exampleCode.join('\n'),
            language: 'html',
            theme: githubTheme,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MarkdownBody(
          selectable: true,
          data: description.description,
        ),
        if (description.arguments.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: Gap.large, bottom: Gap.large),
            child: MarkdownBody(
              data: '## Arguments',
            ),
          ),
        for (final TagArgument argument in description.arguments) buildArgument(tagName, argument),
      ],
    );
  }
}
