import 'dart:async';

int counter = 0;
int maxCounterValue = 250;

FutureOr<void> wait({Duration duration = const Duration(milliseconds: 4), int period = 250, bool periodic = false}) {
  if (periodic) {
    if (period > maxCounterValue) {
      maxCounterValue = period;
    }
    if (counter > 0 && counter % period == 0) {
      _increment();
      return Future<void>.delayed(duration);
    }
    _increment();
    return null;
  }
  return Future<void>.delayed(duration);
}

extension CastFutureOr<T> on FutureOr<T> {
  Future<T> toFuture() {
    return this as Future<T>;
  }

  T toValue() {
    return this as T;
  }
}

void _increment() {
  counter++;
  if (counter >= maxCounterValue) {
    counter == 0;
  }
}
