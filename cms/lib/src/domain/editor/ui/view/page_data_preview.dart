import 'package:code_text_field/code_text_field.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/json.dart';
import 'package:tools/tools.dart';

import '../../../../service/code_style/code_theme.dart';
import '../../../../service/config/config.dart';

class PageDataPreview extends StatefulWidget {
  const PageDataPreview({
    required this.field,
    required this.data,
    super.key,
  });

  final Field field;
  final Json data;

  @override
  State<PageDataPreview> createState() => _PageDataPreviewState();
}

class _PageDataPreviewState extends State<PageDataPreview> {
  final RegExp badCharactersRegExp = RegExp(r'''[^\-\\=%~*\[\]\w\s}{":/,?.'$!#)(]''', caseSensitive: false, multiLine: true, unicode: true);

  String get code {
    final Json effectiveData = <String, dynamic>{...widget.data};
    effectiveData.remove(widget.field.id);
    final String code = prettyJson(effectiveData, indent: '  ');
    return code.replaceAll(badCharactersRegExp, '');
  }

  late final String effectiveCode = code;

  late final CodeController controller = CodeController(
    language: json,
    text: effectiveCode,
  );

  @override
  Widget build(BuildContext context) {
    final int lines = effectiveCode.split('\n').length;

    return Theme(
      data: context.theme.copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: kPaddingLarge),
        ),
      ),
      child: CodeTheme(
        data: CodeThemeData(
          styles: codeTheme.map(
            (String key, TextStyle value) => MapEntry(
              key,
              value.copyWith(
                fontSize: 18,
              ),
            ),
          ),
        ),
        child: CodeField(
          expands: true,
          readOnly: true,
          lineNumberStyle: LineNumberStyle(
            margin: 0,
            width: (lines.toString()).length * 12 + 25,
            background: Colors.transparent,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          controller: controller,
        ),
      ),
    );
  }
}
