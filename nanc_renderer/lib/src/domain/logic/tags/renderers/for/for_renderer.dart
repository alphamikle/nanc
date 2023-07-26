import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:tools/tools.dart';

import '../../documentation/documentation.dart';
import '../../logic/for_storage.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import 'for_arguments.dart';
import 'for_values_parser.dart';
import 'for_widget.dart';

const String _cycle = 'cycle';
const String kIndex = 'index';
const String kValue = 'value';
const String kCycleId = r'_$cycle:::cfa87eee-8b16-43ff-8cb9-4300f01a37b9';
final RegExp cycleRegExp = RegExp(r'cycle\.(?<indexOrValue>[-:\w]+)\.?(?<restOfTheExpression>[.\w]+)?');

TagRenderer forRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_reiterate,
    tagType: TagType.other,
    tag: 'for',
    description: TagDescription(
      description: '''
# For (Cycles)

For - is a special tag / widget, that allows you to have a cycles inside your UI markup. To use these cycles you just need to wrap your widget with `<for>` and set up a variable, which you want iterate through. To do so you have two options:

1. Use a numbered range, for example:

```
<for in="{{ 0...10 }}">
  <someWidget indexDependentParam="{{ cycle.index }}" valueDependentParam="{{ cycle.value }}"/>
</for>
```
With this spelling you will display your widget 10 times with the indexes from the 0 till 9 and the values from the 0 till the 9;

If we change numbers to `{{ 10...20 }}` - then the indexes will be the same and values will be from the 10 till the 19.

2. Use an iterable value from the page context:

For example, page context will contain the next data:
```
{
  'user': {
    'age': 37,
    'name': 'Thomas',
    'lastname': 'Anderson',
    'location': {
      'city': 'Zion',
    },
  },
  'friends': [
    'Link',
    'Morpheus',
    'Niobe',
    'Persephone',
    'The Oracle',
    'Trinity',
  ],
  'enemies': [
    {
      'type': 'robot',
      'name': 'Machines',
      'age': 600,
    },
    {
      'type': 'agent',
      'name': 'Agent Smith',
      'age': 40,
    },
    {
      'type': 'program',
      'name': 'Merovingian',
      'age': 51,
    },
    {
      'type': 'program',
      'name': 'The Twins',
      'age': 35,
    },
  ],
}
```

And the following code of the UI will be:
```
<for valueName="friend" indexName="friendIndex" in="{{ page.friends }}">
  <for valueName="enemy" indexName="enemyIndex" in="{{ page.enemies }}">
    <text>
      Friend #{{ cycle.friendIndex }}: {{ cycle.friend }}
      Enemy #{{ cycle.enemyIndex }}: {{ cycle.enemy.name }}
    </text>
  </for>
</for>
```

You also able to create nested cycles, like in example behind, but if you want to be able to use variables from the parent cycle in the child - you will need to set up a names for the indexes and the values. To know how you can do it, please - see the example code.

The last thing about `<for>` is ability to iterate only the part of the array. You can specify the first index (included) of iteration through `from` argument and the last index through `to` argument which will be not included. By default `from` is equal to `0` and `to` is equal to `array.length`. 
''',
      arguments: [
        stringArg('valueName'),
        stringArg('indexName'),
        stringArg('in'),
        intArg('from'),
        intArg('to'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <for in="{{ 10...20 }}">
    <padding bottom="{{ cycle.value }}">
      <container color="#EF5757">
        <padding all="{{ cycle.value }}">
          <text size="{{ cycle.value }}">
            <prop:textStyle overflow="ellipsis" color="#FFFFFF"/>
            - This is the {{ cycle.index }}-th item with the value {{ cycle.value }}
          </text>
        </padding>
      </container>
    </padding>
  </for>
  <divider height="50"/>
  <for valueName="friendName" in="{{ page.mock.friends }}">
    <text>
      Friend #{{ cycle.index }}: {{ cycle.friendName }}
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
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
      parser.parseValues();
      final List<Object?> parsedValues = parser.values.toList();

      int fromIndex = arguments.from ?? 0;
      int toIndex = arguments.to ?? parsedValues.length;

      if (fromIndex < 0) {
        fromIndex = 0;
      }
      if (toIndex > parsedValues.length) {
        toIndex = parsedValues.length;
      }
      if (fromIndex > toIndex) {
        final int tempFromIndex = fromIndex;
        fromIndex = toIndex;
        toIndex = tempFromIndex;
      }

      // ignore: use_build_context_synchronously
      final ForStorage forStorage = ForStorage.of(context);
      forStorage.saveCycleData(cycleId: cycleId, values: parsedValues);

      final List<md.Node> effectiveChildren = [];

      for (int i = fromIndex; i < toIndex; i++) {
        final List<md.Node> preparedChildren = _prepareCycleContent(
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
        rawChildren: richRenderer.renderChildren(context, effectiveChildren),
      );
      return ForWidget(children: extractor.children);
    },
  );
}

List<md.Node> _prepareCycleContent({
  required CycleId cycleId,
  required String indexName,
  required String valueName,
  required int index,
  required List<md.Node> children,
}) {
  final List<md.Node> preparedChildren = [];
  for (final md.Node node in children) {
    preparedChildren.add(
      _prepareCycleChild(
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

md.Node _prepareCycleChild({
  required CycleId cycleId,
  required String indexName,
  required String valueName,
  required int index,
  required md.Node child,
}) {
  if (child is md.Element) {
    final md.Element newElement = md.Element(
      child.tag,
      _prepareCycleContent(
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
