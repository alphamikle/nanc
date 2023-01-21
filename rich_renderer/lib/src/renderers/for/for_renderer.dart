import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/for/for_arguments.dart';
import 'package:rich_renderer/src/renderers/for/for_values_parser.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';
import 'package:tools/tools.dart';

const String _cycle = 'cycle';
const String kIndex = 'index';
const String kValue = 'value';
const String kCycleId = r'_$cycle:::cfa87eee-8b16-43ff-8cb9-4300f01a37b9';
final RegExp cycleRegExp = RegExp(r'cycle\.(?<indexOrValue>[-:\w]+)\.?(?<restOfTheExpression>[.\w]+)?');

TagRenderer forRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_reiterate,
    tag: 'for',
    pattern: RegExp(r'<for.*>'),
    endPattern: RegExp('</for>'),
    description: TagDescription(
      description: '''
      
      ''',
      arguments: [
        stringArg('valueName'),
        stringArg('indexName'),
        stringArg('in'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <for in="{{ page.mock.friends }}">
    <text>
      Friend #{{ cycle.index }}: {{ cycle.value }}
    </text>
  </for>
  <divider height="50"/>
  <for valueName="number" indexName="i" in="{{ 10...20 }}">
    <text size="{{ cycle.value }}">
      <prop:textStyle overflow="ellipsis"/>
      - This is the {{ cycle.i }}-th item with the value {{ cycle.number }}
    </text>
  </for>
  <divider height="50"/>
  <for valueName="friend" indexName="friendIndex" in="{{ page.mock.friends }}">
    <for valueName="enemy" indexName="enemyIndex" in="{{ page.mock.enemies }}">
      <text>
        Friend #{{ cycle.friendIndex }}: {{ cycle.friend }}
        Enemy #{{ cycle.enemyIndex }}: {{ cycle.enemy.name }}
      </text>
    </for>
    <divider height="25"/>
  </for>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final String cycleId = generateEventHash();
      final ForArguments arguments = ForArguments.fromJson(element.attributes);
      final String valueName = arguments.valueName ?? kValue;
      final String indexName = arguments.indexName ?? kIndex;
      String values = arguments.values ?? '0...1';
      final String oldValues = arguments.oldValues ?? '';

      /// Example: original expression was {{ page.mock.friends }}
      /// [values] will be equals to [Link, Morpheus, Niobe, Persephone, The Oracle, Trinity]
      /// and [oldValues] will be equals to page.mock.friends
      ///
      /// if they are equals, they both of range type, not values type
      if (values != oldValues) {
        values = oldValues;
      }
      final ForValuesParser parser = ForValuesParser(context: context, valuesString: values);
      await parser.parseValues();
      final List<Object?> parsedValues = parser.values.toList();
      // ignore: use_build_context_synchronously
      final ForStorage forStorage = ForStorage.of(context);
      forStorage.saveCycleData(cycleId: cycleId, values: parsedValues);

      final List<md.Node> effectiveChildren = [];

      for (int i = 0; i < parsedValues.length; i++) {
        final List<md.Node> preparedChildren = await _prepareCycleContent(
          cycleId: cycleId,
          indexName: indexName,
          valueName: valueName,
          index: i,
          children: element.children ?? [],
        );
        effectiveChildren.addAll(preparedChildren);
      }

      final PropertiesExtractor extractor = PropertiesExtractor(
        context: context,
        // ignore: use_build_context_synchronously
        rawChildren: await richRenderer.renderChildren(context, effectiveChildren),
      );

      return compactWidgets(extractor.children);
    },
  );
}

Future<List<md.Node>> _prepareCycleContent({
  required CycleId cycleId,
  required String indexName,
  required String valueName,
  required int index,
  required List<md.Node> children,
}) async {
  final List<md.Node> preparedChildren = [];
  for (final md.Node node in children) {
    preparedChildren.add(
      await _prepareCycleChild(
        cycleId: cycleId,
        indexName: indexName,
        valueName: valueName,
        index: index,
        child: node,
      ),
    );
  }
  return preparedChildren;
}

Future<md.Node> _prepareCycleChild({
  required CycleId cycleId,
  required String indexName,
  required String valueName,
  required int index,
  required md.Node child,
}) async {
  await wait(periodic: true, period: 50);
  if (child is md.Element) {
    final md.Element newElement = md.Element(
      child.tag,
      await _prepareCycleContent(
        cycleId: cycleId,
        indexName: indexName,
        valueName: valueName,
        index: index,
        children: child.children ?? [],
      ),
    );
    for (final MapEntry<String, String> attributeEntry in child.attributes.entries) {
      newElement.attributes[attributeEntry.key] = _replaceSimpleCycleExpressionWithComplex(
        cycleId: cycleId,
        indexName: indexName,
        valueName: valueName,
        index: index,
        value: attributeEntry.value,
      );
    }
    return newElement;
  } else if (child is md.Text) {
    return md.Text(
      _replaceSimpleCycleExpressionWithComplex(
        cycleId: cycleId,
        indexName: indexName,
        valueName: valueName,
        index: index,
        value: child.textContent,
      ),
    );
  } else if (child is md.UnparsedContent) {
    return md.UnparsedContent(
      _replaceSimpleCycleExpressionWithComplex(
        cycleId: cycleId,
        indexName: indexName,
        valueName: valueName,
        index: index,
        value: child.textContent,
      ),
    );
  }
  throw Exception('Unknown Node: ${child.runtimeType}');
}

String _replaceSimpleCycleExpressionWithComplex({
  required CycleId cycleId,
  required String indexName,
  required String valueName,
  required int index,
  required String value,
}) {
  final String normalizedIndexName = '$kIndex:::$indexName';
  final String normalizedValueName = '$kValue:::$valueName';
  final String normalizedValue = value
      .replaceAll(
        '$_cycle.$indexName',
        '$_cycle.$normalizedIndexName',
      )
      .replaceAll(
        '$_cycle.$valueName',
        '$_cycle.$normalizedValueName',
      );

  final Iterable<RegExpMatch> matches = cycleRegExp.allMatches(normalizedValue);
  if (matches.isEmpty) {
    return normalizedValue;
  }

  String enrichmentValue = normalizedValue;
  for (final RegExpMatch match in matches) {
    final String indexOrValue = match.namedGroup('indexOrValue')!;
    if (indexOrValue == normalizedIndexName || indexOrValue == normalizedValueName) {
      enrichmentValue = enrichmentValue.replaceFirst(
        '$_cycle.$indexOrValue',
        '$_cycle($cycleId)($index)($indexOrValue)',
      );
    }
  }
  return enrichmentValue;
}
