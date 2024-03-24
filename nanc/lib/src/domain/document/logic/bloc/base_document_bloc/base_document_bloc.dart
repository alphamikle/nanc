import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../draft/logic/draft_service.dart';
import '../document_bloc/document_state.dart';
import 'base_page_state.dart';

abstract class BaseDocumentBloc<T extends BaseDocumentState> extends Cubit<T> {
  BaseDocumentBloc({
    required T state,
    required this.draftService,
  }) : super(state);

  final DraftService draftService;

  ModelId? modelId;
  DocumentId? documentId;

  String? get draftKey {
    if (modelId == null && documentId == null) {
      return null;
    }
    return DraftService.generateKey([modelId ?? 'no_model_id', documentId ?? 'no_document_id']);
  }

  dynamic valueForKey(String key) => state.data[key];

  void updateValue(FieldId fieldId, dynamic fieldValue) {
    final Json data = <String, dynamic>{
      ...state.data,
    };
    final bool isValueEmpty = isEmpty(fieldValue);
    if (isValueEmpty) {
      data.remove(fieldId);
    } else {
      data[fieldId] = fieldValue;
    }
    _updateData(data);
  }

  void updateValues(Json json) {
    for (final MapEntry<FieldId, dynamic> entry in json.entries) {
      updateValue(entry.key, entry.value);
    }
  }

  TextEditingController controllerFor(FieldId fieldId) {
    if (state.controllerMap.containsKey(fieldId) == false) {
      if (state is DocumentState) {
        final DocumentState pageState = state as DocumentState;
        emit(pageState.copyWith(controllerMap: {
          ...pageState.controllerMap,
          fieldId: TextEditingController(),
        }) as T);
      } else {
        emit(state.copyWith(controllerMap: {
          ...state.controllerMap,
          fieldId: TextEditingController(),
        }) as T);
      }
    }
    return state.controllerMap[fieldId]!;
  }

  bool fieldWasChanged(FieldId fieldId) {
    return state.diff[fieldId] ?? false;
  }

  void _updateData(Json data) {
    Json? jsonState;
    if (state is DocumentState) {
      final DocumentState pageState = state as DocumentState;
      emit(pageState.copyWith(data: data) as T);
      jsonState = (state as DocumentState).toJson();
    } else {
      emit(state.copyWith(data: data) as T);
      jsonState = state.toJson();
    }
    if (draftKey != null && state.isChanged) {
      unawaited(draftService.saveDraft(key: draftKey!, data: jsonState));
    } else if (draftKey != null) {
      unawaited(draftService.deleteDraft(draftKey!));
    }
  }
}
