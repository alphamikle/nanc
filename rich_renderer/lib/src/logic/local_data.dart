import 'package:flutter/material.dart';

typedef DataId = String;
typedef ValueId = String;

const String kDataId = 'dataId';
const String kValueId = 'valueId';

final RegExp _localDataQueryRegExp = RegExp(r'data\((?<dataId>\w+)\)\.(?<valueId>\w+)');

class LocalData extends InheritedWidget {
  const LocalData({
    required super.child,
    required this.data,
    super.key,
  });

  final Map<DataId, Map<ValueId, String>> data;

  static LocalData of(BuildContext context) {
    final LocalData? localDataStorage = context.dependOnInheritedWidgetOfExactType<LocalData>();
    if (localDataStorage == null) {
      throw Exception('Not found LocalDataStorage at the widget tree');
    }
    return localDataStorage;
  }

  static Iterable<RegExpMatch> getMatches(String value) => _localDataQueryRegExp.allMatches(value);

  static String? findData({
    required BuildContext context,
    required DataId dataId,
    required ValueId valueId,
  }) {
    return LocalData.of(context).getValue(dataId: dataId, valueId: valueId);
  }

  void setValue({
    required String dataId,
    required String valueId,
    required String value,
  }) {
    if (!data.containsKey(dataId)) {
      data[dataId] = {};
    }
    data[dataId]![valueId] = value;
  }

  String? getValue({
    required String dataId,
    required String valueId,
  }) {
    return data[dataId]?[valueId];
  }

  void delete({
    required DataId dataId,
    required ValueId valueId,
  }) {
    if (data.containsKey(dataId)) {
      if (data[dataId]!.containsKey(valueId)) {
        data[dataId]!.remove(valueId);
      }
      if (data[dataId]!.isEmpty) {
        data.remove(dataId);
      }
    }
  }

  @override
  bool updateShouldNotify(LocalData oldWidget) => oldWidget.data != data;
}
