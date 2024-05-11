import 'dart:io';
import 'dart:typed_data';

import 'package:nanc_tools/nanc_tools.dart';

typedef Microseconds = int;
typedef AvgTimeMs = Microseconds;
typedef Percentile95TimeMs = Microseconds;
typedef MedianTimeMs = Microseconds;
typedef Metrics = (AvgTimeMs, MedianTimeMs, Percentile95TimeMs);
typedef Action = void Function();

// That path as is, because tests suppose to run from the project's root dir
String readFileAsString(String fileName) {
  return File([Directory.current.path, '/test/data/', fileName].join()).readAsStringSync();
}

Uint8List readFileAsBytes(String fileName) {
  return File([Directory.current.path, '/test/data/', fileName].join()).readAsBytesSync();
}

Metrics calculateMetrics(List<Microseconds> timeTable) {
  timeTable.sort();
  final int avg = timeTable.fold(0, (sum, it) => sum + it) ~/ timeTable.length;
  final int median = timeTable.median.toInt();
  final int percentile95 = timeTable.percentile(95).toInt();

  return (
    avg,
    median,
    percentile95,
  );
}

Metrics runExperiments({
  required String id,
  required int iterations,
  required Action action,
}) {
  final List<Microseconds> timings = [];
  for (int i = 0; i < iterations; i++) {
    Bench.startSilent(id);
    action();
    timings.add(Bench.endRaw(id, compensate: true));
  }
  return calculateMetrics(timings);
}

void printMetrics(String id, Metrics metrics) {
  // ignore: avoid_print
  print('''
Metrics of "$id"
Average time: ${metrics.$1} microseconds
Median time: ${metrics.$2} microseconds
95 percentile time: ${metrics.$3} microseconds
--------------------------------------------------
''');
}

extension ExtendedDoubleList on List<num> {
  num get median => percentile(50);

  num percentile(int value) {
    assert(value >= 0 && value <= 100);
    final List<num> sortedList = [...this];
    sortedList.sort();
    final double itemsPerPercent = length / 100;
    int targetIndex = (value * itemsPerPercent).ceil();
    if (targetIndex > length) {
      targetIndex = length;
    }
    return sortedList[targetIndex - 1];
  }
}
