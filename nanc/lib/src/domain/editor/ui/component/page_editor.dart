import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_code_text_field/nanc_code_text_field.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/config/config.dart';
import '../../../ui_kit/domain/ui/components/kit_code_preview/code_theme.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import '../../logic/bloc/editor/editor_bloc.dart';
import '../../logic/bloc/editor/editor_state.dart';

class PageEditor extends StatefulWidget {
  const PageEditor({
    this.codeFieldKey,
    super.key,
  });

  final GlobalKey<CodeFieldState>? codeFieldKey;

  @override
  State<PageEditor> createState() => _PageEditorState();
}

class _PageEditorState extends State<PageEditor> {
  @override
  Widget build(BuildContext context) {
    final EditorBloc editorBloc = context.read();
    final ThemeData theme = context.theme;

    return KitInkWell(
      onPressed: () {},
      noReaction: true,
      mouseCursor: SystemMouseCursors.text,
      child: Theme(
        data: theme.copyWith(
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
                value.copyWith(fontSize: 18),
              ),
            ),
          ),
          child: BlocBuilder<EditorBloc, EditorState>(
            builder: (BuildContext context, EditorState state) {
              final int lines = state.xmlContent.split('\n').length;

              return BlocBuilder<EditorBloc, EditorState>(
                builder: (BuildContext context, EditorState state) {
                  return CodeField(
                    readOnly: state.isSyncedWithFile,
                    key: widget.codeFieldKey,
                    focusNode: editorBloc.focusNode,
                    expands: true,
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
                    controller: editorBloc.controller,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
