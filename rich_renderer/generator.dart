void main() {
  for (final int value in numbersGenerator()) {
    print(value);
  }
}

const int from = 0;
const int to = 100;

Iterable<int> numbersGenerator() sync* {
  int index = 0;
  while (index < to) {
    yield index;
    index++;
  }
}
