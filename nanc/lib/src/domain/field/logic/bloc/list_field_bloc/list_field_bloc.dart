import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../../ui/structured_field_cell/structured_field_item.dart';
import '../../fields/dynamic_field/dynamic_field_item.dart';

typedef FieldChanged = void Function(String fieldId, Object? value);

class ListFieldBloc extends BaseDocumentBloc<BaseDocumentState> {
  ListFieldBloc({
    required this.onEdit,
    required super.draftService,
    this.item,
    this.structuredItem,
  }) : super(state: BaseDocumentState.empty()) {
    if (item != null) {
      _initStateWithItem(item!);
    } else if (structuredItem != null) {
      _initStateWithStructuredItem(structuredItem!);
    }
  }

  final FieldChanged onEdit;
  final DynamicFieldItem? item;
  final StructuredFieldItem? structuredItem;

  @override
  TextEditingController controllerFor(String fieldId) {
    if (!state.controllerMap.containsKey(fieldId)) {
      final List<String> oldKeys = state.data.keys.toList();
      dynamic fieldValue;
      if (oldKeys.isNotEmpty) {
        for (final String key in oldKeys) {
          final dynamic oldFieldValue = state.data[key];
          if (oldFieldValue != null) {
            fieldValue = oldFieldValue;
            break;
          }
        }
        for (final String key in oldKeys) {
          state.data.remove(key);
        }
      }
      final String text = fieldValue == null ? '' : fieldValue.toString();
      emit(state.copyWith(
        controllerMap: {
          ...state.controllerMap,
          fieldId: TextEditingController(text: text),
        },
      ));
    }
    return state.controllerMap[fieldId]!;
  }

  @override
  void updateValue(String fieldId, dynamic fieldValue) {
    onEdit(fieldId, fieldValue);
    super.updateValue(fieldId, fieldValue);
  }

  @override
  void updateValues(Json json) {
    for (final MapEntry<String, dynamic> entry in json.entries) {
      onEdit(entry.key, entry.value);
    }
    super.updateValues(json);
  }

  void _initStateWithItem(DynamicFieldItem item) {
    final Json value = item.valueObject;
    emit(state.copyWith(
      data: value,
      controllerMap: {
        item.field.id: item.controller,
      },
    ));
  }

  void _initStateWithStructuredItem(StructuredFieldItem structuredItem) {
    final Json data = <String, dynamic>{...state.data};
    final TextControllerMap controllerMap = {...state.controllerMap};
    for (final DynamicFieldItem item in structuredItem.items) {
      data[item.field.id] = item.value;
      controllerMap[item.field.id] = item.controller;
    }
    emit(state.copyWith(
      data: data,
      controllerMap: controllerMap,
    ));
  }
}
