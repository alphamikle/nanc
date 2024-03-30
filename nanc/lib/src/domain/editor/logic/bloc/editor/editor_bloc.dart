import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/xml.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';

import '../../../../field/logic/fields/screen_field/screen_content_model.dart';
import '../../../../file_syncer/logic/file_syncer_interface.dart';
import '../../../../general/logic/model/menu_element.dart';
import '../../../../ui_kit/domain/ui/components/code_text_field/code_field/code_controller.dart';
import '../../../../ui_kit/domain/ui/components/code_text_field/code_field/code_field.dart';
import 'editor_event.dart';
import 'editor_state.dart';

final RegExp _prettyCodeRegExp = RegExp(r'> \s{1,3}');

class EditorBloc extends Cubit<EditorState> {
  EditorBloc({
    required this.eventBus,
    EditorState? initialState,
  }) : super(initialState ?? EditorState.empty()) {
    controller.addListener(controllerListener);
    emit(state);
  }

  @protected
  final EventBus eventBus;
  final GlobalKey<CodeFieldState> codeFieldKey = GlobalKey();
  late final CodeController controller = CodeController(language: xml);
  final FocusNode focusNode = FocusNode();

  FileSyncer? fileSyncer;
  StreamSubscription<String?>? fileContentSubscription;
  StreamSubscription<bool>? syncerActiveStatusSubscription;

  Future<void> initFromModel(ScreenContentModel model) async {
    if (state.isSyncedWithFile == false) {
      logInfo('Init from model');
      await _updateContent(model.content);
      emit(state.copyWith(contentType: model.contentType));
    }
  }

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
      emit(state.copyWith(isSyncedWithFile: true));
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
    fileContentSubscription = null;
    syncerActiveStatusSubscription = null;
    await fileSyncer?.dispose();
    fileSyncer = null;
    emit(state.copyWith(isSyncedWithFile: false));
  }

  Future<void> clearEditor() async => _updateContent('');

  void toggleMode() {
    emit(state.copyWith(
      contentType: state.contentType.isScrollable ? ScreenContentType.stack : ScreenContentType.scrollable,
    ));
  }

  void toggleAsyncRendering() => emit(state.copyWith(asyncMode: !state.asyncMode));

  @protected
  void controllerListener() {
    if (state.isSyncedWithFile == false) {
      emit(state.copyWith(xmlContent: controller.text));
    }
  }

  Future<void> selectTag(MenuElement tagElement, TagRenderer tagRenderer) async {
    emit(state.copyWith(
      activeElement: tagElement,
      activeTagRenderer: tagRenderer,
      canChangeContentType: tagRenderer.availableNuiWidget.isAny,
    ));
    final String example = tagRenderer.example.replaceAll(_prettyCodeRegExp, '>\n').trim();
    await initFromModel(
      ScreenContentModel(
        content: example,
        contentType: tagRenderer.availableNuiWidget.isScrollable ? ScreenContentType.scrollable : ScreenContentType.stack,
      ),
    );
  }

  void _sendChangedEvent(EditorState state) => eventBus.send(eventId: EditorEvent.changed, request: state);

  Future<void> _fileContentListener(String? fileContent) async {
    if (fileContent != null && fileContent != controller.text) {
      logInfo('File content listener');
      await _updateContent(fileContent);
      emit(state.copyWith(xmlContent: fileContent));
    }
  }

  void _syncerStatusListener(bool isActive) {
    if (isActive == false) {
      unawaited(closeSync());
    }
  }

  Future<void> _updateContent(String content) async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 30));
      controller.value = TextEditingValue(text: content);
    } catch (error, stackTrace) {
      logError('Error on updating text content', error: error, stackTrace: stackTrace);
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
