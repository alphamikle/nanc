import 'logg.dart';

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
}
