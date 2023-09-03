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
