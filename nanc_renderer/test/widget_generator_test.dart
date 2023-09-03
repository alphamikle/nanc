import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/widget_generator/xml_widget_generator.dart';
import 'package:tools/tools.dart';

import 'data/generator_data.dart';
import 'tools/test_tools.dart';

void main() {
  group('Widget generator test', () {
    /*
      XML-Generation timing:
      Widgets generated: 41
      Iterations: 100
      Min: 1.182ms
      Max: 67.534ms
      Avg: 2.2449100000000004ms
      Median: 1.246ms
      75p: 1.369ms
      90p: 2.715ms
      95p: 3.602ms
      99p: 7.549ms
      Sum: 224.49100000000007
     */
    test('Generation time from xml', () async {
      runTests(xmlCode: testXmlCode);
    });

    /*
      BINARY-Generation timing:
      Widgets generated: 41
      Iterations: 100
      Min: 0.645ms
      Max: 42.305ms
      Avg: 1.4348599999999996ms
      Median: 0.723ms
      75p: 0.948ms
      90p: 1.792ms
      95p: 2.308ms
      99p: 4.964ms
      Sum: 143.48599999999993
     */
    test('Generation time from binary form', () async {
      final Uint8List binaryNodes = base64Decode(testBinaryNodes);

      runTests(binaryNodes: binaryNodes);
    });

    /*
      NODES-Generation timing:
      Widgets generated: 41
      Iterations: 100
      Min: 0.015ms
      Max: 15.733ms
      Avg: 0.18276000000000012ms
      Median: 0.023ms
      75p: 0.025ms
      90p: 0.036ms
      95p: 0.048ms
      99p: 0.117ms
      Sum: 18.275999999999964
     */
    test('Generation time from nodes', () async {
      runTests(nodes: testTagNodes);
    });
  });
}

void runTests({String? xmlCode, Uint8List? binaryNodes, List<TagNode>? nodes}) {
  assert(xmlCode != null || nodes != null || binaryNodes != null);

  const int iterations = 100;
  final List<double> durations = [];
  final List<Widget> generatedWidgets = [];

  for (int i = 0; i < iterations; i++) {
    generatedWidgets.clear();

    Bench.startSilent('generation');

    final XmlWidgetGenerator generator = XmlWidgetGenerator.test(
      data: xmlCode,
      nodes: nodes,
      binary: binaryNodes,
      richRenderer: RichRenderer(renderers: []),
    );
    final GeneratorResult result = generator.generate();
    generatedWidgets.addAll(result.$1);
    final double duration = Bench.endSilent('generation');
    durations.add(duration);
  }

  final String prefix = switch ((xmlCode, binaryNodes, nodes)) {
    (String(), null, null) => 'XML-',
    (null, Uint8List(), null) => 'BINARY-',
    (null, null, List<TagNode>()) => 'NODES-',
    _ => 'UNKNOWN-'
  };

  final String result = '''
${prefix}Generation timing:
Widgets generated: ${generatedWidgets.length}
Iterations: $iterations
Min: ${durations.min}ms
Max: ${durations.max}ms
Avg: ${durations.average}ms
Median: ${durations.median}ms
75p: ${durations.percentile(75)}ms
90p: ${durations.percentile(90)}ms
95p: ${durations.percentile(95)}ms
99p: ${durations.percentile(99)}ms
Sum: ${durations.sum}
''';

  logInfo(result);
}
