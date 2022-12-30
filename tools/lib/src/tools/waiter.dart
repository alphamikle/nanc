import 'dart:async';

int counter = 0;
int maxCounterValue = 250;

FutureOr<void> wait({Duration duration = Duration.zero, int period = 250, bool asyncIterator = false}) {
  if (asyncIterator) {
    if (period > maxCounterValue) {
      maxCounterValue = period;
    }
    if (counter > 0 && counter % period == 0) {
      _increment();
      return Future<void>.delayed(duration);
    }
    _increment();
  } else {
    return Future<void>.delayed(duration);
  }
}

void _increment() {
  counter++;
  if (counter >= maxCounterValue) {
    counter == 0;
  }
}
