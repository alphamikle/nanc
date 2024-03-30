abstract final class Delayer {
  static int _index = 0;

  static bool needToPause({int pauseEveryCycles = 20}) {
    _index++;
    if (_index >= 50000) {
      _index = 0;
    }
    if (_index % pauseEveryCycles == 0) {
      return true;
    }
    return false;
  }

  static Future<void> pause({Duration duration = const Duration(milliseconds: 4)}) async {
    await Future<void>.delayed(duration);
  }
}
