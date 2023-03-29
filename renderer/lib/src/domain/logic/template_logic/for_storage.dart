import 'package:flutter/cupertino.dart';
import 'package:rich_renderer/src/tools/chain_extractor.dart';

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

  static Iterable<Object?> findEmbedData(BuildContext context, String value) {
    final RegExpMatch? match = _cycleRegExp.firstMatch(value);
    if (match == null) {
      return [];
    }
    final String cycleId = match.namedGroup('cycleId')!;
    final String index = match.namedGroup('index')!;
    final String paramName = match.namedGroup('paramName')!;
    final String expression = match.namedGroup('expression')!;
    final ForStorage storage = ForStorage.of(context);
    final dynamic cycleData = storage.getCycleData(cycleId);
    if (cycleData == null) {
      return [];
    }
    final dynamic embedData = extractValueByChain(cycleData, [index, ...expression.split('.')]) ?? [];
    return embedData;
  }

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
