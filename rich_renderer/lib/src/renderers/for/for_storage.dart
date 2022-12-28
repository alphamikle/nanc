import 'package:flutter/cupertino.dart';

class ForStorage extends InheritedWidget {
  const ForStorage({
    required super.child,
    required this.valueName,
    required this.indexName,
    super.key,
  });

  final String valueName;
  final String indexName;

  @override
  bool updateShouldNotify(ForStorage oldWidget) => oldWidget.valueName != valueName || oldWidget.indexName != indexName;
}
