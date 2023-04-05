import 'package:flutter/material.dart';
import 'package:flutter_highlight2/flutter_highlight.dart';
import 'package:flutter_highlight2/themes/github.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/text_extractor.dart';
import '../property/mapper/properties_extractor.dart';
import 'code_arguments.dart';

// TODO(alphamikle): This tag wouldn't work until markdown will not be replaced by another parser logic
TagRenderer codeRenderer() {
  return TagRenderer(
    icon: IconPack.flu_code_filled,
    tag: 'code',
    description: const TagDescription.empty(),
    example: '''
<code language="html">
  `<padding>
    <placeholder/>
  </padding>`
</code>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final CodeArguments arguments = CodeArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (arguments.language == null) {
        return ErrorWidget.withDetails(message: '"language" param must been specified');
      }

      final List<String> content = extractTextFromChildren(context: context, element: element);

      return HighlightView(
        content.join('\n'),
        language: arguments.language!,
        theme: githubTheme,
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      );
    },
  );
}
