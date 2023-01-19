import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/page_state.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

const String _kIdWasChanged = 'idWasChanged';

/// Used for creation or edition of fields
class FieldEditionBloc extends BasePageBloc<PageState> with EntityPageBlocStub implements PageBloc {
  FieldEditionBloc({
    required Model entity,
    required Field? field,
    required FieldType fieldType,
    required super.draftService,
  }) : super(state: PageState.empty()) {
    final Json entityFieldsJson = _mapEntityToFieldsJson(entity, field ?? FieldMapper.fieldTypeToField(fieldType));
    final TextControllerMap controllerMap = _mapPageDataToControllerMap(entityFieldsJson);
    entityFieldsJson[fieldNameProperty] = fieldType.name;
    emit(state.copyWith(
      data: entityFieldsJson,
      controllerMap: controllerMap,
      initialData: clone(entityFieldsJson),
    ));
  }

  @override
  TextEditingController controllerFor(String fieldCode) {
    if (!state.controllerMap.containsKey(fieldCode)) {
      emit(state.copyWith.controllerMap({
        ...state.controllerMap,
        fieldCode: TextEditingController(),
      }));
    }
    return state.controllerMap[fieldCode]!;
  }

  @override
  dynamic valueForKey(String key) => state.data[key];

  @override
  void updateValue(String fieldId, dynamic fieldValue) {
    final Json data = <String, dynamic>{
      ...state.data,
    };
    data[fieldId] = fieldValue;
    if (fieldId == fieldNameProperty) {
      if (data[_kIdWasChanged] != true) {
        final String id = toSnackCase(fieldValue.toString());
        data[fieldIdProperty] = id;
        final TextEditingController idTextEditingController = controllerFor(fieldIdProperty);
        idTextEditingController.text = id;
      }
    } else if (fieldId == fieldIdProperty) {
      data[_kIdWasChanged] = true;
    }
    emit(state.copyWith(data: data));
  }

  Field compileToField() {
    logg(1);
    return FieldMapper.jsonToField(state.data);
  }

  @override
  bool fieldWasChanged(String field) => false;

  @override
  Future<void> delete(Model model) async => throw UnimplementedError('"delete" method not implemented for the "field_edition_bloc"');

  TextControllerMap _mapPageDataToControllerMap(Json entityData) {
    final TextControllerMap controllerMap = {};
    for (final MapEntry<String, dynamic> entry in entityData.entries) {
      final dynamic value = entry.value;
      final bool isNull = value == null;
      controllerMap[entry.key] = TextEditingController(text: isNull ? '' : value.toString());
    }
    return controllerMap;
  }

  Json _mapEntityToFieldsJson(Model entity, Field field) {
    final bool isEmptyField = field.isEmpty;
    final List<Field> fields = entity.flattenFields;
    final Json fieldJson = FieldMapper.fieldToJson(field);
    final Json output = <String, dynamic>{
      ...fieldJson,
    };
    for (final Field field in fields) {
      final String fieldId = field.id;
      final dynamic value = fieldJson[fieldId];
      if (isEmptyField) {
        output[fieldId] = null;
        if (field.defaultValues.contains(fieldId)) {
          output[fieldId] = value;
        }
      } else {
        output[fieldId] = value;
      }
    }
    return output;
  }

  @override
  Future<void> reset(Model model) async {}

  @override
  Future<Json> loadPageData({required String pageId, Model? model, String? modelId}) async {
    throw UnimplementedError();
  }
}
