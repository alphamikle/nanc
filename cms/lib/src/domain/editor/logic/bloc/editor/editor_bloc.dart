import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/editor/logic/bloc/editor/editor_event.dart';
import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/service/code_style/rich_markdown.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:fields/fields.dart';
import 'package:file_syncer/file_syncer.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

class EditorBloc extends Cubit<EditorState> {
  EditorBloc({
    required this.eventBus,
    required this.patternMap,
    EditorState? initialState,
  }) : super(initialState ?? EditorState.empty()) {
    controller.addListener(controllerListener);
    emit(state);
  }

  @protected
  final EventBus eventBus;
  final Map<String, TextStyle> patternMap;
  final GlobalKey<CodeFieldState> codeFieldKey = GlobalKey();
  late final CodeController controller = CodeController(language: richMarkdown, patternMap: patternMap);
  final FocusNode focusNode = FocusNode();

  FileSyncer? fileSyncer;
  StreamSubscription<String?>? fileContentSubscription;
  StreamSubscription<bool>? syncerActiveStatusSubscription;

  void initFromModel(ScreenContentModel model) => controller.text = model.content;

  Future<void> syncWithFile() async {
    if (this.fileSyncer != null) {
      return;
    }
    final FileSyncer fileSyncer = FileSyncer();
    fileContentSubscription = fileSyncer.fileContent.listen(_fileContentListener);
    syncerActiveStatusSubscription = fileSyncer.syncerActiveStatus.listen(_syncerStatusListener);
    final bool result = await fileSyncer.syncWithFile();
    if (result) {
      this.fileSyncer = fileSyncer;
      emit(state.copyWith(
        isSyncedWithFile: true,
      ));
    } else {
      await fileContentSubscription?.cancel();
      await syncerActiveStatusSubscription?.cancel();
      fileContentSubscription = null;
      syncerActiveStatusSubscription = null;
    }
  }

  Future<void> closeSync() async {
    await syncerActiveStatusSubscription?.cancel();
    await fileContentSubscription?.cancel();
    await fileSyncer?.dispose();
    fileSyncer = null;
    emit(state.copyWith(
      isSyncedWithFile: false,
    ));
  }

  void clearEditor() => controller.text = '';

  @protected
  void controllerListener() {
    emit(
      state.copyWith(
        markdownContent: controller.text,
      ),
    );
  }

  void _sendChangedEvent(EditorState state) => eventBus.send(eventId: EditorEvent.changed, request: state);

  void _fileContentListener(String? fileContent) {
    try {
      if (fileContent != null && fileContent != controller.text) {
        controller.text = fileContent;
      }
    } catch (error) {
      // Handle error
      controller.text = '''
$fileContent
<!-- Fix very faint text for TextEditingController -->
''';
      controller.text = fileContent!;
      logg('GOT AN ERROR ON PASTING THE TEXT: $error');
    }
  }

  void _syncerStatusListener(bool isActive) {
    if (isActive == false) {
      unawaited(closeSync());
    }
  }

  @override
  void onChange(Change<EditorState> change) {
    _sendChangedEvent(change.nextState);
    super.onChange(change);
  }

  @override
  Future<void> close() {
    controller.removeListener(controllerListener);
    return super.close();
  }
}
