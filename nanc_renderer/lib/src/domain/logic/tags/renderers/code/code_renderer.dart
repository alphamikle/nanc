import 'package:flutter/material.dart';
import 'package:flutter_highlight2/flutter_highlight.dart';
import 'package:flutter_highlight2/themes/github.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/renderers/code/code_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/text_extractor.dart';

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
