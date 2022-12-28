import 'package:flutter/material.dart';

final RegExp _rangeValuesRegExp = RegExp(r'^{{ *(?<from>\d+)\.\.\.(?<to>\d+) *}}$');

class ForValuesParser {
  ForValuesParser({
    required this.context,
    required this.valuesString,
  });

  final BuildContext context;
  final String valuesString;

  Iterable<Object> get values => _iterator();

  bool get _isNumberedIterator => _fromNumber != null && _toNumber != null;
  bool get _isValuesIterator => _values != null;
  int? _fromNumber;
  int? _toNumber;
  List<Object>? _values;

  Future<void> parseValues() async {
    final RegExpMatch? match = _rangeValuesRegExp.firstMatch(valuesString);
    if (match != null) {
      _fromNumber = int.parse(match.namedGroup('from')!);
      _toNumber = int.parse(match.namedGroup('to')!);
    }
    // TODO(alphamikle): Implement search of complex values in the global storage or values resolver
  }

  Iterable<Object> _iterator() sync* {
    int index = _fromNumber ?? 0;
    if (_isNumberedIterator) {
      while (index < _toNumber!) {
        yield index;
        index++;
      }
    }
  }
}
