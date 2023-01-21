import 'package:flutter/cupertino.dart';

typedef CycleId = String;
final RegExp _cycleRegExp = RegExp(r'cycle\((?<cycleId>[-:\w]+)\)\((?<index>\d+)\)\((?<paramName>[-:\w]+)\)\.?(?<expression>[-\w.]*)?');

class ForStorage extends InheritedWidget {
  ForStorage({
    required super.child,
    super.key,
  });

  final Map<CycleId, List<Object?>> _cycleData = {};

  static ForStorage of(BuildContext context) {
    final ForStorage? forStorage = context.dependOnInheritedWidgetOfExactType<ForStorage>();
    if (forStorage == null) {
      throw Exception('Not found ForStorage at the widget tree');
    }
    return forStorage;
  }

  static Iterable<RegExpMatch> getMatches(String value) => _cycleRegExp.allMatches(value);

  void saveCycleData({required CycleId cycleId, required List<Object?> values}) {
    _cycleData[cycleId] = values;
  }

  List<Object?>? getCycleData(CycleId cycleId) {
    return _cycleData[cycleId];
  }

  void removeCycleData(CycleId cycleId) => _cycleData.remove(cycleId);

  @override
  bool updateShouldNotify(ForStorage oldWidget) => _cycleData != oldWidget._cycleData;
}
