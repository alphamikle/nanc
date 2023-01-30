import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/draft/logic/draft_service.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/page_state.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

abstract class BasePageBloc<T extends BaseEntityPageState> extends Cubit<T> {
  BasePageBloc({
    required T state,
    required this.draftService,
  }) : super(state);

  final DraftService draftService;

  String? modelId;
  String? pageId;

  String? get draftKey {
    if (modelId == null && pageId == null) {
      return null;
    }
    return DraftService.generateKey([modelId ?? 'no_model_id', pageId ?? 'no_page_id']);
  }

  dynamic valueForKey(String key) => state.data[key];

  void updateValue(String fieldId, dynamic fieldValue) {
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
    final Json data = <String, dynamic>{
      ...state.data,
    };
    for (final MapEntry<String, dynamic> entry in json.entries) {
      final bool isValueEmpty = isEmpty(entry.value);
      if (isValueEmpty) {
        data.remove(entry.key);
      } else {
        data[entry.key] = entry.value;
      }
    }
    _updateData(data);
  }

  TextEditingController controllerFor(String fieldCode) {
    if (!state.controllerMap.containsKey(fieldCode)) {
      if (state is PageState) {
        final PageState pageState = state as PageState;
        emit(pageState.copyWith(controllerMap: {
          ...pageState.controllerMap,
          fieldCode: TextEditingController(),
        }) as T);
      } else {
        emit(state.copyWith(controllerMap: {
          ...state.controllerMap,
          fieldCode: TextEditingController(),
        }) as T);
      }
    }
    return state.controllerMap[fieldCode]!;
  }

  bool fieldWasChanged(String field) {
    return state.diff[field] ?? false;
  }

  void _updateData(Json data) {
    Json? jsonState;
    if (state is PageState) {
      final PageState pageState = state as PageState;
      emit(pageState.copyWith(data: data) as T);
      jsonState = (state as PageState).toJson();
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
