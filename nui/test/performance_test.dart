import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui_converter/nui_converter.dart';

import 'tools/diagnostics/diagnostics.dart';
import 'tools/test_tools.dart';

Json getContextData() {
  final String rawJson = readFileAsString('nalmart_context_data.json');
  return castToJson(jsonDecode(rawJson));
}

const int iterations = 50;

const String xmlId = 'Time to handle XML';
const String jsonId = 'Time to handle JSON';
const String protoId = 'Time to handle Protobuf';

const bool withXml = false;
const bool withJson = false;
const bool withProtobuf = false;

void main() {
  group('Source code handling time tests', () {
    /// All tests were made on the Galaxy S24 Ultra
    /// Average time: 702 microseconds
    /// Median time: 673 microseconds
    /// 95 percentile time: 825 microseconds
    test(xmlId, skip: withXml == false, () async {
      final String xmlSource = readFileAsString('nalmart_ui_code.html');

      final Metrics metrics = runExperiments(
        id: xmlId,
        iterations: iterations,
        action: () => TagsConverter.fromXml(xmlSource),
      );

      printMetrics(xmlId, metrics);
    });

    /// For decoded json
    /// Average time: 335 microseconds
    /// Median time: 326 microseconds
    /// 95 percentile time: 402 microseconds
    ///
    /// For encoded json (decoding on each iteration)
    /// Average time: 591 microseconds
    /// Median time: 566 microseconds
    /// 95 percentile time: 725 microseconds
    test(jsonId, skip: withJson == false, () async {
      final String jsonSource = readFileAsString('nalmart_ui_code.json');
      // final dynamic parsedJson = jsonDecode(jsonSource);

      final Metrics metrics = runExperiments(
        id: jsonId,
        iterations: iterations,
        // action: () => TagsConverter.fromJson(parsedJson),
        action: () => TagsConverter.fromJson(jsonDecode(jsonSource)),
      );

      printMetrics(jsonId, metrics);
    });

    /// Average time: 552 microseconds
    /// Median time: 538 microseconds
    /// 95 percentile time: 638 microseconds
    test(protoId, skip: withProtobuf == false, () async {
      final Uint8List protobufSource = readFileAsBytes('nalmart_ui_code.pb');

      final Metrics metrics = runExperiments(
        id: protoId,
        iterations: iterations,
        action: () => TagsConverter.fromBinary(protobufSource),
      );

      printMetrics(protoId, metrics);
    });
  });

  group('Rendering performance', () {
    test('Initial rendering performance metrics', () async {
      final Directory metricsDataDir = Directory('${Directory.current.path}/test/data/performance_metrics');
      final List<File> metricsFiles = metricsDataDir.listSync().whereType<File>().toList();
      final List<String> pathsToMetrics = metricsFiles.map((File it) => it.path.replaceFirst(it.parent.path, 'performance_metrics')).toList();

      for (final String path in pathsToMetrics) {
        final String source = readFileAsString(path);
        final Diagnostics diagnostics = Diagnostics.fromJson(jsonDecode(source));

        final List<FlutterFrame> framesInfo = diagnostics.performance?.flutterFrames ?? [];

        final List<int> elapsedTimings = framesInfo.map((FlutterFrame frame) => frame.elapsed).toList();

        elapsedTimings.sort((int a, int b) => b.compareTo(a));

        final List<int> worstCases = elapsedTimings.sublist(0, iterations);

        final Metrics metrics = calculateMetrics(worstCases);

        printMetrics(path, metrics);
      }
    });
  });
}
