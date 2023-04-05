import 'dart:convert';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../provider/entity_page_provider.dart';
import '../base_entity_page_bloc/base_page_bloc.dart';
import 'page_state.dart';

enum PageEvents {
  save,
}

typedef ParentEntityDataId = String;
typedef ChildEntityDataId = String;

class PageBloc extends BasePageBloc<PageState> {
  PageBloc({
    required this.modelListBloc,
    required this.pageProvider,
    required this.eventBus,
    required super.draftService,
  }) : super(state: PageState.empty());

  final ModelListBloc modelListBloc;
  final PageProvider pageProvider;
  final EventBus eventBus;

  Future<void> loadPage(String modelId, String pageId) async {
    this.modelId = modelId;
    this.pageId = pageId;
    emit(state.copyWith.isLoading(true));
    await wait(duration: const Duration(milliseconds: 50));
    final Model? model = modelListBloc.findModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    final bool draftResult = await _preloadDraft(modelId);
    if (draftResult) {
      return;
    }
    final Json data = await loadPageData(model: model, pageId: pageId);
    final Json dynamicStructure = await _loadDynamicStructure(model: model, pageId: pageId);
    final TextControllerMap controllerMap = _mapPageDataToControllerMap(modelId, data);
    data.addAll(dynamicStructure);
    emit(state.copyWith(
      data: data,
      initialData: clone(data),
      controllerMap: controllerMap,
      thirdTableData: {},
      thirdTable: ThirdTable.empty(),
      isLoading: false,
    ));
  }

  Future<void> save(Model model) async {
    emit(state.copyWith.isSaving(true));
    try {
      for (final MapEntry<ModelId, Map<ParentEntityDataId, List<ChildEntityDataId>>> thirdTableEntry in state.thirdTableData.entries) {
        await pageProvider.saveThirdTable(
          thirdTable: state.thirdTable,
          parentEntityId: thirdTableEntry.value.keys.first,
          childEntityIds: thirdTableEntry.value.values.first,
        );
      }
      final Json savedData = await pageProvider.saveEditedPage(
        entity: model,
        id: state.data[model.idField.id].toString(),
        data: _updateCreatedAtOrUpdatedAtFields(model, _clearDataFromStructures(state.data)),
      );
      await _upsertDynamicFieldStructures(
        pageId: state.data[model.idField.id].toString(),
        data: state.data,
        creation: false,
      );
      await _deleteDraft();
      emit(state.copyWith(
        data: savedData,
        initialData: clone(savedData),
        thirdTableData: {},
        controllerMap: _remapPageDataToControllerMap(model.id, savedData),
      ));
      eventBus.send(eventId: PageEvents.save, request: model);
    } catch (error) {
      // Handle error
      emit(state.copyWith.isSaving(false));
      rethrow;
    }
    emit(state.copyWith.isSaving(false));
  }

  Future<void> create(Model model) async {
    emit(state.copyWith.isSaving(true));
    try {
      final Json savedData = await pageProvider.createPage(
        entity: model,
        data: _updateCreatedAtOrUpdatedAtFields(model, _clearDataFromStructures(state.data)),
      );
      await _upsertDynamicFieldStructures(
        pageId: savedData[model.idField.id].toString(),
        data: state.data,
        creation: true,
      );
      await _deleteDraft();
      emit(state.copyWith(
        data: savedData,
        initialData: clone(savedData),
        thirdTableData: {},
      ));
      eventBus.send(eventId: PageEvents.save, request: model);
    } catch (error) {
      emit(state.copyWith.isSaving(false));
      rethrow;
    }
    emit(state.copyWith.isSaving(false));
  }

  Future<void> delete(Model model) async {
    emit(state.copyWith(isDeleting: true));
    try {
      await pageProvider.deletePage(model: model, pageId: state.data[model.idField.id].toString());
      await _deleteDraft();
      modelId = null;
      pageId = null;
      emit(state.copyWith(isDeleting: false));
    } catch (error) {
      emit(state.copyWith(isDeleting: false));
      rethrow;
    }
  }

  Future<void> reset(Model model) async {
    await _deleteDraft();
  }

  Future<void> prepareForCreation(ModelId modelId) async {
    this.modelId = modelId;
    pageId = null;
    emit(state.copyWith(isLoading: true));
    emit(PageState.empty());
    final Model? model = modelListBloc.findModelById(modelId);
    if (model == null) {
      throw Exception('Error while loading model page with id "$modelId"');
    }
    final bool draftResult = await _preloadDraft(modelId);
    if (draftResult) {
      return;
    }
    final Json pageData = model.createEmptyData();
    if (model.isCollection == false) {
      pageData[model.idField.id] = model.id;
    }
    final TextControllerMap controllerMap = _mapPageDataToControllerMap(modelId, pageData);
    emit(PageState.optional(
      data: pageData,
      initialData: clone(pageData),
      controllerMap: controllerMap,
      isLoading: false,
    ));
  }

  Future<bool> isPageExist(String modelId, String pageId) async {
    try {
      await loadPageData(modelId: modelId, pageId: pageId);
      return true;
    } catch (error) {
      return false;
    }
  }

  void updateThirdTableValue(ThirdTable thirdTable, Map<ParentEntityDataId, List<ChildEntityDataId>> thirdTableData) {
    emit(state.copyWith.thirdTable(thirdTable));
    emit(state.copyWith.thirdTableData({
      ...state.thirdTableData,
      thirdTable.relationsEntity.id: thirdTableData,
    }));
  }

  bool hasThirdTableData(ModelId entityId) => state.thirdTableData.containsKey(entityId);

  Future<bool> _preloadDraft(String modelId) async {
    if (draftKey != null && await draftService.haveDraft(draftKey!)) {
      final PageState draftState = PageState.fromJson(await draftService.getDraft(draftKey!));
      final TextControllerMap controllerMap = _mapPageDataToControllerMap(modelId, draftState.data);
      emit(draftState.copyWith(
        isLoading: false,
        controllerMap: controllerMap,
      ));
      return true;
    }
    return false;
  }

  Json _clearDataFromStructures(Json json) {
    final Json clearData = <String, dynamic>{...json};
    final List<String> keys = clearData.keys.toList();
    for (final String key in keys) {
      if (isStructureField(key)) {
        clearData.remove(key);
      }
    }
    return clearData;
  }

  Future<Json> loadPageData({
    required String pageId,
    Model? model,
    String? modelId,
  }) async {
    assert(model != null || modelId != null);
    await wait(duration: const Duration(milliseconds: 50));
    final Model? effectiveModel = model ?? modelListBloc.findModelById(modelId!);
    if (effectiveModel == null) {
      throw Exception('Error while loading model page data with id "$modelId"');
    }
    final Json data = await pageProvider.fetchPageData(
      model: effectiveModel,
      id: pageId,
      subset: effectiveModel.flattenFields.where((Field field) => field.editableField).map((Field field) => field.id).toList(),
    );
    return data;
  }

  Future<void> _upsertDynamicFieldStructures({
    required String pageId,
    required Json data,
    required bool creation,
  }) async {
    final List<String> structureFields = data.keys.where((String key) => isStructureField(key)).toList();
    if (structureFields.isNotEmpty) {
      for (final String key in structureFields) {
        final String structureId = await encrypt(generateStructurePageId(key, pageId));
        final Json structure = await generateStructureJson(id: structureId, structure: data[key]);
        await pageProvider.upsertPage(
          entity: structureModel,
          id: structureId,
          data: structure,
        );
      }
    }
  }

  Future<Json> _loadDynamicStructure({
    required Model model,
    required String pageId,
  }) async {
    if (model.dynamicFields.isEmpty) {
      return <String, dynamic>{};
    }
    final Json result = <String, dynamic>{};
    for (final String dynamicField in model.dynamicFields) {
      final String structureId = await encrypt(generateStructurePageId(generateStructureFieldId(dynamicField), pageId));
      try {
        final Json dynamicStructure = await pageProvider.fetchPageData(
          model: structureModel,
          id: structureId,
          subset: structureModel.flattenFields.map((Field field) => field.id).toList(),
        );
        final String encryptedStructureString = await decrypt(dynamicStructure[kStructureField] as String);
        final dynamic encryptedStructureJson = jsonDecode(encryptedStructureString);
        result[generateStructureFieldId(dynamicField)] = encryptedStructureJson;
      } catch (error) {
        // Handle error
        logg('NOT FOUND A DYNAMIC FIELD FOR THE PAGE ID: $pageId OF MODEL: $model');
      }
    }
    return result;
  }

  TextControllerMap _mapPageDataToControllerMap(String entityId, Json entityData) {
    final TextControllerMap controllerMap = {};
    for (final MapEntry<String, dynamic> entry in entityData.entries) {
      final dynamic value = entry.value;
      final bool isNull = value == null;
      controllerMap[entry.key] = TextEditingController(text: isNull ? '' : value.toString());
    }
    return controllerMap;
  }

  TextControllerMap _remapPageDataToControllerMap(String entityId, Json entityData) {
    final TextControllerMap controllerMap = {};
    for (final MapEntry<String, dynamic> entry in entityData.entries) {
      final String value = (entry.value ?? '').toString();
      final bool hasValue = value.isNotEmpty;
      final String oldValue = controllerFor(entry.key).text.trim();
      final bool hasOldValue = oldValue.isNotEmpty;
      final bool isDifferentValues = (hasValue || hasOldValue) && value != oldValue;

      controllerMap[entry.key] = TextEditingController(
        text: isDifferentValues ? value : oldValue,
      );
    }
    return controllerMap;
  }

  Future<void> _deleteDraft() async {
    if (draftKey != null) {
      await draftService.deleteDraft(draftKey!);
    }
  }

  Json _updateCreatedAtOrUpdatedAtFields(Model model, Json data) {
    final List<DateField> dateTimeFields = model.flattenFields.whereType<DateField>().toList();
    if (dateTimeFields.isNotEmpty) {
      for (final DateField field in dateTimeFields) {
        final dynamic currentValue = data[field.id];
        if (field.isCreatedAtField && (currentValue == null || currentValue == '') || field.isUpdatedAtField) {
          data[field.id] = DateTime.now().toIso8601String();
        }
      }
    }
    return data;
  }
}

mixin EntityPageBlocStub implements PageBloc {
  @override
  Future<void> create(Model entity) => throw UnimplementedError();

  @override
  ModelListBloc get modelListBloc => throw UnimplementedError();

  @override
  PageProvider get pageProvider => throw UnimplementedError();

  @override
  EventBus get eventBus => throw UnimplementedError();

  @override
  bool hasThirdTableData(ModelId entityId) => throw UnimplementedError();

  @override
  Future<void> loadPage(String entityId, String pageId) => throw UnimplementedError();

  @override
  Future<void> prepareForCreation(ModelId entityId) => throw UnimplementedError();

  @override
  Future<void> save(Model entity) => throw UnimplementedError();

  @override
  void updateThirdTableValue(ThirdTable thirdTable, Map<ParentEntityDataId, List<ChildEntityDataId>> thirdTableData) {}

  @override
  Future<bool> isPageExist(String entityId, String pageId) => throw UnimplementedError();
}
