import 'package:code_text_field/src/code_field/editor_params.dart';
import 'package:flutter/material.dart';

abstract class CodeModifier {

  const CodeModifier(this.char);
  final String char;

  // Helper to insert [str] in [text] between [start] and [end]
  TextEditingValue replace(String text, int start, int end, String str) {
    final len = str.length;
    return TextEditingValue(
      text: text.replaceRange(start, end, str),
      selection: TextSelection(
        baseOffset: start + len,
        extentOffset: start + len,
      ),
    );
  }

  TextEditingValue? updateString(
    String text,
    TextSelection sel,
    EditorParams params,
  );
}
