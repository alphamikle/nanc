import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/json.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import '../kit_modal/kit_modal.dart';
import '../kit_text.dart';
import 'code_theme.dart';

class KitJsonPreview extends StatefulWidget {
  const KitJsonPreview({
    required this.data,
    this.excludedKeys = const {},
    super.key,
  });

  final Set<Pattern> excludedKeys;

  /// ? [Map<String, dynamic>] or [List<Map<String, dynamic>>]
  final dynamic data;

  @override
  State<KitJsonPreview> createState() => _KitJsonPreviewState();
}

class _KitJsonPreviewState extends State<KitJsonPreview> {
  final RegExp badCharactersRegExp = RegExp(r'''[^\-\\=%~*\[\]\w\s}{":/,?.'$!#)(]''', caseSensitive: false, multiLine: true, unicode: true);

  String get code {
    if (widget.data is Json) {
      final String code = prettyJson(filterJson(widget.data), indent: '  ');
      return code.replaceAll(badCharactersRegExp, '');
    } else if (widget.data is List<dynamic>) {
      final List<dynamic> output = [];
      for (final dynamic rawJson in widget.data) {
        try {
          final Json json = castToJson(rawJson);
          output.add(filterJson(json));
        } catch (error) {
          output.add(rawJson);
        }
      }
      final String code = prettyJson(output, indent: '  ');
      return code.replaceAll(badCharactersRegExp, '');
    }
    return '{}';
  }

  Json filterJson(Json json) {
    final Json effectiveData = <String, dynamic>{...json};
    final Set<String> keysToDelete = {};
    for (final Pattern excludedKey in widget.excludedKeys) {
      if (excludedKey is String) {
        keysToDelete.add(excludedKey);
      } else if (excludedKey is RegExp) {
        for (final String key in effectiveData.keys) {
          if (excludedKey.hasMatch(key)) {
            keysToDelete.add(key);
          }
        }
      }
    }
    for (final String key in keysToDelete) {
      effectiveData.remove(key);
    }
    return effectiveData;
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
          contentPadding: EdgeInsets.only(left: Gap.large),
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

Future<void> showJsonPreviewModal({
  required BuildContext context,
  required String title,
  required dynamic structure,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => KitModal(
      onClose: () => context.navigator.pop(),
      header: KitText(text: title),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Gap.large),
        child: KitJsonPreview(data: structure),
      ),
    ),
  );
}
