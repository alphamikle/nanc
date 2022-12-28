import 'package:cms/src/domain/editor/logic/bloc/editor/editor_event.dart';
import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';

class PreviewBloc extends Cubit<PreviewState> {
  PreviewBloc({
    required this.eventBus,
  }) : super(PreviewState.empty()) {
    eventBus.onEvent(consumer: runtimeType.toString(), eventId: EditorEvent.changed, handler: _handleEditorChanges);
    eventBus.onEvent(consumer: runtimeType.toString(), eventId: EditorEvent.scroll, handler: _handleScrollChanges);
  }

  @protected
  final EventBus eventBus;
  final ScrollController scrollController = ScrollController();

  void _handleEditorChanges(EditorState editorState) {
    emit(state.copyWith(
      isLoading: editorState.isLoading,
      markdownContent: editorState.markdownContent,
    ));
  }

  Future<void> _handleScrollChanges(double editorScrollPercent) async {
    const double criticalAnimatedDiff = 0.07;
    final double percent = scrollController.offset / scrollController.position.maxScrollExtent;
    final double diff = (editorScrollPercent - percent).abs();
    final double targetOffset = scrollController.position.maxScrollExtent * editorScrollPercent;

    /// ? Too big scroll difference we will animate, short - not
    if (diff > criticalAnimatedDiff) {
      final int animationTime = (1000 * diff).toInt();
      await scrollController.animateTo(targetOffset, duration: Duration(milliseconds: animationTime), curve: Curves.easeOutCubic);
    } else {
      scrollController.jumpTo(targetOffset);
    }
  }
}
