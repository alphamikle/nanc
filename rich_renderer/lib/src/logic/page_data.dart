import 'package:flutter/material.dart';

String _nextValue(int index) {
  return '(\\.(?<value$index>\\w+))?';
}

String _generateRegExp() {
  const String foundation = r'page\.(?<value>\w+)';
  return [
    foundation,
    for (int i = 1; i < 25; i++) _nextValue(i),
  ].join();
}

final RegExp _pageDataQueryRegExp = RegExp(_generateRegExp());

class PageData extends InheritedWidget {
  const PageData({
    required super.child,
    required this.data,
    super.key,
  });

  final Map<String, dynamic> data;

  static PageData of(BuildContext context) {
    final PageData? pageData = context.dependOnInheritedWidgetOfExactType<PageData>();
    if (pageData == null) {
      throw Exception('Not found PageData at the widget tree');
    }
    return pageData;
  }

  static Iterable<RegExpMatch> getMatches(String value) => _pageDataQueryRegExp.allMatches(value);

  static String? findData({
    required BuildContext context,
    required String? query,
  }) {
    if (query == null) {
      return null;
    }
    return PageData.of(context).getValue(query: query);
  }

  String? getValue({
    required String? query,
  }) {
    if (query == null) {
      return null;
    }

    /// ? Remove "page" item at start
    final List<String> queryPieces = query.split('.')..removeAt(0);
    return _finder(queryPieces);
  }

  String? _finder(List<String> pieces) {
    dynamic currentValue;
    for (int i = 0; i < pieces.length; i++) {
      final String piece = pieces[i];
      final bool isLast = i == pieces.length - 1;
      if (i == 0) {
        currentValue = data[piece];
      } else if (currentValue is List) {
        final int? pieceIndex = int.tryParse(piece);
        if (pieceIndex != null && pieceIndex < currentValue.length) {
          currentValue = currentValue[pieceIndex];
        } else {
          return null;
        }
      } else if (currentValue is Map) {
        currentValue = currentValue[piece];
      } else if (currentValue == null) {
        return null;
      }
      if (isLast) {
        return currentValue?.toString();
      }
    }
    return null;
  }

  @override
  bool updateShouldNotify(PageData oldWidget) => oldWidget.data != data;
}
