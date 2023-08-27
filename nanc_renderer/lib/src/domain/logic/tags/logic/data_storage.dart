import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';

import '../tools/chain_extractor.dart';

final RegExp _storageRegExp = RegExp(r'data(\.\w+)+');

class DataStorage extends Cubit<Json> {
  DataStorage({
    Json data = const {},
  }) : super(data);

  static DataStorage of(BuildContext context) {
    final DataStorage? dataStorage = context.read();
    if (dataStorage == null) {
      throw Exception('Not found DataStorage at the widget tree');
    }
    return dataStorage;
  }

  static Iterable<RegExpMatch> getMatches(String value) => _storageRegExp.allMatches(value);

  static String? findData({
    required BuildContext context,
    required String? query,
  }) {
    if (query == null) {
      return null;
    }
    return DataStorage.of(context).getValue(query: query)?.toString();
  }

  Object? getValue({
    required String? query,
  }) {
    if (query == null) {
      return null;
    }

    /// ? Remove "storage" item at start
    final List<String> queryPieces = query.split('.')..removeAt(0);
    return _valueFinder(queryPieces);
  }

  String? getValueAsString({
    required String? query,
  }) {
    if (query == null) {
      return null;
    }

    /// ? Remove "page" item at start
    final List<String> queryPieces = query.split('.')..removeAt(0);
    return _valueAsStringFinder(queryPieces);
  }

  void updateValue(String key, Object? value) {
    final List<String> pieces = key.split('.');
    final Json newState = updateValueByChain(state, value, pieces);
    emit(newState);
  }

  Object? _valueFinder(List<String> pieces) {
    return extractValueByChain(state, pieces);
  }

  String? _valueAsStringFinder(List<String> pieces) {
    return extractValueAsStringByChain(state, pieces);
  }
}
