import 'package:flutter/widgets.dart';

@immutable
class CodeThemeData {

  const CodeThemeData({
    required this.styles,
  });
  final Map<String, TextStyle> styles;

  @override
  int get hashCode => styles.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CodeThemeData && styles == other.styles;
  }
}
