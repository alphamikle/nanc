import 'logg.dart';

void _emptyFunction() {}

class Bench {
  static final Map<String, int> _starts = <String, int>{};

  static void start(dynamic id) {
    final String benchId = id.toString();
    if (_starts.containsKey(benchId)) {
      logInfo('Benchmark already have comparing with id=$benchId in time');
    } else {
      _starts[benchId] = DateTime.now().microsecondsSinceEpoch;
    }
  }

  static void startSilent(String id) {
    _starts[id] = DateTime.now().microsecondsSinceEpoch;
  }

  static double end(dynamic id) {
    final String benchId = id.toString();
    if (!_starts.containsKey(benchId)) {
      logInfo('In Benchmark not placed comparing with id=$benchId');
      return 0;
    }
    final double diff = (DateTime.now().microsecondsSinceEpoch - _starts[benchId]!) / 1000;
    logInfo('''
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
BENCHMARK
$benchId need ${diff}ms
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
''');
    _starts.remove(benchId);
    return diff;
  }

  static double endSilent(String id) {
    final int now = DateTime.now().microsecondsSinceEpoch;
    if (_starts.containsKey(id)) {
      final double result = (now - _starts[id]!) / 1000;
      _starts.remove(id);
      return result;
    }
    return 0;
  }

  static int endRaw(String id, {bool compensate = false}) {
    final int now = DateTime.now().microsecondsSinceEpoch;
    final int result = now - _starts[id]!;
    _starts.remove(id);

    /// Compensation for the overhead carried by benchmark itself
    if (compensate) {
      const String tempId = '288013ba-66f8-4e6c-b25b-9a54bd12e169';
      Bench.startSilent(tempId);
      _emptyFunction();
      final int baseNow = DateTime.now().microsecondsSinceEpoch;
      final int baseResult = baseNow - _starts[tempId]!;
      _starts.remove(tempId);
      return (result - baseResult);
    }
    return result;
  }
}
