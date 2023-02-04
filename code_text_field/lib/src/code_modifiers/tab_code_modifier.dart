import 'package:code_text_field/src/code_field/editor_params.dart';
import 'package:code_text_field/src/code_modifiers/code_modifier.dart';
import 'package:flutter/widgets.dart';

class TabModifier extends CodeModifier {
  const TabModifier() : super('\t');

  @override
  TextEditingValue? updateString(
    String text,
    TextSelection sel,
    EditorParams params,
  ) {
    final tmp = replace(text, sel.start, sel.end, ' ' * params.tabSpaces);
    return tmp;
  }
}
