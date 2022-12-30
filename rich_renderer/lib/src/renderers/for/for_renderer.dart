import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/for/for_arguments.dart';
import 'package:rich_renderer/src/renderers/for/for_values_parser.dart';
import 'package:rich_renderer/src/renderers/for/for_widget.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:tools/tools.dart';

// TODO(alphamikle): Need more time to implement; For now - moved to TODO
TagRenderer forRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_reiterate,
    tag: 'for',
    pattern: RegExp(r'<for.*>'),
    endPattern: RegExp('</for>'),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ForArguments arguments = ForArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      final String valueName = arguments.valueName ?? 'value';
      final String indexName = arguments.indexName ?? 'index';
      final String values = arguments.values ?? '{{ 0...1 }}';

      final ForValuesParser parser = ForValuesParser(context: context, valuesString: values);
      await parser.parseValues();

      // TODO(alphamikle): Тут прилетают сырые атрибуты, необходимо распарсить "in" - или вытаскивать из него числа, или вытаскивать данные

      logg('FOR ARGUMENTS: $arguments');
      return Builder(
        builder: (BuildContext context) {
          final Future<PropertiesExtractor> extractorFuture = richRenderer.renderChildren(context, element.children).then(
                (List<Widget> rawChildren) => PropertiesExtractor(
                  context: context,
                  rawChildren: rawChildren,
                ),
              );

          return FutureBuilder<PropertiesExtractor>(
            future: extractorFuture,
            builder: (BuildContext context, AsyncSnapshot<PropertiesExtractor> asyncExtractor) {
              if (asyncExtractor.hasData == false) {
                return const ForWidget(children: []);
              }
              final PropertiesExtractor extractor = asyncExtractor.requireData;
              return ForWidget(
                children: extractor.children,
              );
            },
          );
        },
      );
    },
  );
}
