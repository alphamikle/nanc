import 'package:cms/src/domain/editor/logic/bloc/editor/editor_bloc.dart';
import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/service/code_style/code_theme.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class PageEditor extends StatelessWidget {
  const PageEditor({
    this.codeFieldKey,
    super.key,
  });

  final GlobalKey<CodeFieldState>? codeFieldKey;

  @override
  Widget build(BuildContext context) {
    final EditorBloc editorBloc = context.read();
    final CodeController codeController = editorBloc.controller;
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
                value.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          child: BlocBuilder<EditorBloc, EditorState>(
            builder: (BuildContext context, EditorState state) {
              final int lines = state.markdownContent.split('\n').length;

              return CodeField(
                key: codeFieldKey,
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
                controller: codeController,
              );
            },
          ),
        ),
      ),
    );
  }
}
