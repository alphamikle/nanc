import 'package:flutter/material.dart';

import '../tools/chain_extractor.dart';
import 'mock_page_data.dart';

String _nextValue(int index) {
  return '(\\.(?<value$index>\\w+))?';
}

String _generateRegExp() {
  const String foundation = r'page\.(?<value>\w+)';
  return [
    foundation,
    for (int i = 1; i < 15; i++) _nextValue(i),
  ].join();
}

final RegExp _pageDataQueryRegExp = RegExp(_generateRegExp());

class DocumentStorage extends InheritedWidget {
  const DocumentStorage({
    required super.child,
    required this.data,
    super.key,
  });

  final Map<String, dynamic> data;

  static DocumentStorage of(BuildContext context) {
    final DocumentStorage? pageData = context.dependOnInheritedWidgetOfExactType<DocumentStorage>();
    if (pageData == null) {
      throw Exception('Not found DocumentStorage at the widget tree');
    }
    return pageData;
  }

  static Iterable<RegExpMatch> getMatches(String value) => _pageDataQueryRegExp.allMatches(value);

  static String? findDataAsString({
    required BuildContext context,
    required String? query,
  }) {
    if (query == null) {
      return null;
    }
    return DocumentStorage.of(context).getValueAsString(query: query);
  }

  static dynamic findData({
    required BuildContext context,
    required String? query,
  }) {
    if (query == null) {
      return null;
    }
    return DocumentStorage.of(context).getValue(query: query);
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

  dynamic getValue({
    required String? query,
  }) {
    if (query == null) {
      return null;
    }

    /// ? Remove "page" item at start
    final List<String> queryPieces = query.split('.')..removeAt(0);
    return _valueFinder(queryPieces);
  }

  String? _valueAsStringFinder(List<String> pieces) {
    if (pieces.first == 'mock') {
      return extractValueAsStringByChain(<String, dynamic>{'mock': mockData}, pieces);
    }
    return extractValueAsStringByChain(data, pieces);
  }

  dynamic _valueFinder(List<String> pieces) {
    if (pieces.first == 'mock') {
      return extractValueByChain(<String, dynamic>{'mock': mockData}, pieces);
    }
    return extractValueByChain(data, pieces);
  }

  @override
  bool updateShouldNotify(DocumentStorage oldWidget) => oldWidget.data != data;
}
