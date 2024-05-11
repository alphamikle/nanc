import 'dart:convert';
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

const int iterations = 1000;

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

  group('Scrolling performance metrics', () {
    /// Default cacheExtent
    /// Metrics of "Native scrolling with frames: 2666"
    /// Average time: 3531 microseconds
    /// Median time: 3182 microseconds
    /// 95 percentile time: 5600 microseconds
    ///
    /// Cache extent = 0
    /// Metrics of "Native scrolling with frames: 3210"
    /// Average time: 3458 microseconds
    /// Median time: 3139 microseconds
    /// 95 percentile time: 5299 microseconds
    test('Native UI metrics', () async {
      final String source = readFileAsString('native_full_screen_tracing.json');
      final Diagnostics diagnostics = Diagnostics.fromJson(jsonDecode(source));

      final List<FlutterFrame> framesInfo = diagnostics.performance?.flutterFrames ?? [];

      final List<int> elapsedTimings = framesInfo.map((FlutterFrame frame) => frame.elapsed).toList();

      final Metrics metrics = calculateMetrics(elapsedTimings);

      printMetrics('Native scrolling with frames: ${elapsedTimings.length}', metrics);
    });

    /// Default cacheExtent
    /// Metrics of "Nui scrolling with frames: 2833"
    /// Average time: 3505 microseconds
    /// Median time: 2928 microseconds
    /// 95 percentile time: 5232 microseconds
    ///
    /// Cache extent = 0
    /// Metrics of "Nui scrolling with frames: 3176"
    /// Average time: 3498 microseconds
    /// Median time: 3099 microseconds
    /// 95 percentile time: 5425 microseconds
    test('Nui metrics', () async {
      final String source = readFileAsString('nui_full_screen_tracing.json');
      final Diagnostics diagnostics = Diagnostics.fromJson(jsonDecode(source));

      final List<FlutterFrame> framesInfo = diagnostics.performance?.flutterFrames ?? [];

      final List<int> elapsedTimings = framesInfo.map((FlutterFrame frame) => frame.elapsed).toList();

      final Metrics metrics = calculateMetrics(elapsedTimings);

      printMetrics('Nui scrolling with frames: ${elapsedTimings.length}', metrics);
    });
  });
}
