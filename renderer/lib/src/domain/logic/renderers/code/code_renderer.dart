import 'package:flutter/material.dart';
import 'package:flutter_highlight2/flutter_highlight.dart';
import 'package:flutter_highlight2/themes/github.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/code/code_arguments.dart';
import 'package:rich_renderer/src/tools/text_extractor.dart';

// TODO(alphamikle): This tag wouldn't work until markdown will not be replaced by another parser logic
TagRenderer codeRenderer() {
  return TagRenderer(
    icon: IconPack.flu_code_filled,
    tag: 'code',
    pattern: RegExp(r'<code.*>'),
    endPattern: RegExp('</code>'),
    description: const TagDescription.empty(),
    example: '''
<code language="html">
  `<padding>
    <placeholder/>
  </padding>`
</code>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final CodeArguments arguments = CodeArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      if (arguments.language == null) {
        return ErrorWidget.withDetails(message: '"language" param must been specified');
      }

      final List<String> content = await extractTextFromChildren(context: context, element: element);

      return HighlightView(
        content.join('\n'),
        language: arguments.language!,
        theme: githubTheme,
        textStyle: TextStyle(
          fontSize: 16,
        ),
      );
    },
  );
}
