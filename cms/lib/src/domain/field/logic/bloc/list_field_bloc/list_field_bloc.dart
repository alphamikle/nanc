import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../document/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import '../../../../document/logic/bloc/base_entity_page_bloc/base_page_state.dart';

typedef FieldChanged = void Function(String fieldId, Object? value);

class ListFieldBloc extends BasePageBloc<BaseEntityPageState> {
  ListFieldBloc({
    required this.onEdit,
    required super.draftService,
    this.item,
    this.structuredItem,
  }) : super(state: BaseEntityPageState.empty()) {
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
  TextEditingController controllerFor(String fieldCode) {
    if (!state.controllerMap.containsKey(fieldCode)) {
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
          fieldCode: TextEditingController(text: text),
        },
      ));
    }
    return state.controllerMap[fieldCode]!;
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
