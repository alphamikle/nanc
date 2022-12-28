import 'dart:convert';

import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/page_state.dart';
import 'package:cms/src/domain/page/logic/provider/entity_page_provider.dart';
import 'package:cms/src/service/errors/errors.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

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
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final Model? model = modelListBloc.findModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    final Json data = await _loadPageData(modelId, pageId);
    final Json dynamicStructure = await _loadDynamicStructure(model: model, pageId: pageId);
    final TextControllerMap controllerMap = _mapEntityDataToControllerMap(modelId, data);
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

  Future<void> save(Model entity) async {
    emit(state.copyWith.isSaving(true));
    try {
      for (final MapEntry<EntityId, Map<ParentEntityDataId, List<ChildEntityDataId>>> thirdTableEntry in state.thirdTableData.entries) {
        await pageProvider.saveThirdTable(
          thirdTable: state.thirdTable,
          parentEntityId: thirdTableEntry.value.keys.first,
          childEntityIds: thirdTableEntry.value.values.first,
        );
      }
      final Json savedData = await pageProvider.saveEditedEntityPage(
        entity: entity,
        id: state.data[entity.idField.id].toString(),
        data: _clearDataFromStructures(state.data),
      );
      await _upsertDynamicFieldStructures(
        pageId: state.data[entity.idField.id].toString(),
        data: state.data,
        creation: false,
      );
      emit(state.copyWith(
        data: savedData,
        initialData: clone(savedData),
        thirdTableData: {},
        controllerMap: _mapEntityDataToControllerMap(entity.id, savedData),
      ));
      eventBus.send(eventId: PageEvents.save, request: entity);
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
      final Json savedData = await pageProvider.createEntityPage(
        entity: model,
        data: _clearDataFromStructures(state.data),
      );
      await _upsertDynamicFieldStructures(
        pageId: savedData[model.idField.id].toString(),
        data: state.data,
        creation: true,
      );
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
      if (draftKey != null) {
        await draftService.deleteDraft(draftKey!);
      }
      modelId = null;
      pageId = null;
      emit(state.copyWith(isDeleting: false));
    } catch (error) {
      emit(state.copyWith(isDeleting: false));
      rethrow;
    }
  }

  Future<void> prepareForCreation(EntityId modelId) async {
    // TODO(alphamikle): Preload existed draft
    this.modelId = modelId;
    pageId = null;
    emit(state.copyWith.isLoading(true));
    emit(PageState.empty());
    final Model? entity = modelListBloc.findModelById(modelId);
    if (entity == null) {
      throw Exception('Error while loading model page data with id "$modelId"');
    }
    if (draftKey != null && await draftService.haveDraft(draftKey!)) {
      final PageState draftState = PageState.fromJson(await draftService.getDraft(draftKey!));
      final TextControllerMap controllerMap = _mapEntityDataToControllerMap(modelId, draftState.data);
      emit(draftState.copyWith(
        isLoading: false,
        controllerMap: controllerMap,
      ));
      return;
    }
    final Json pageData = entity.createEmptyData();
    if (entity.isCollection == false) {
      pageData[entity.idField.id] = entity.id;
    }
    final TextControllerMap controllerMap = _mapEntityDataToControllerMap(modelId, pageData);
    emit(state.copyWith(
      data: pageData,
      initialData: clone(pageData),
      controllerMap: controllerMap,
    ));
    emit(state.copyWith.isLoading(false));
  }

  Future<bool> isPageExist(String entityId, String pageId) async {
    try {
      await _loadPageData(entityId, pageId);
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

  bool hasThirdTableData(EntityId entityId) => state.thirdTableData.containsKey(entityId);

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

  Future<Json> _loadPageData(String entityId, String pageId) async {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final Model? entity = modelListBloc.findModelById(entityId);
    if (entity == null) {
      throw Exception('Error while loading model page data with id "$entityId"');
    }
    final Json data = await pageProvider.fetchEntityPageData(
      entity: entity,
      id: pageId,
      subset: entity.flattenFields.map((Field field) => field.id).toList(),
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
        final Json dynamicStructure = await pageProvider.fetchEntityPageData(
          entity: structureModel,
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

  TextControllerMap _mapEntityDataToControllerMap(String entityId, Json entityData) {
    final TextControllerMap controllerMap = {};
    for (final MapEntry<String, dynamic> entry in entityData.entries) {
      final dynamic value = entry.value;
      final bool isNull = value == null;
      controllerMap[entry.key] = TextEditingController(text: isNull ? '' : value.toString());
    }
    return controllerMap;
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
  bool hasThirdTableData(EntityId entityId) => throw UnimplementedError();

  @override
  Future<void> loadPage(String entityId, String pageId) => throw UnimplementedError();

  @override
  Future<void> prepareForCreation(EntityId entityId) => throw UnimplementedError();

  @override
  Future<void> save(Model entity) => throw UnimplementedError();

  @override
  void updateThirdTableValue(ThirdTable thirdTable, Map<ParentEntityDataId, List<ChildEntityDataId>> thirdTableData) {}

  @override
  Future<bool> isPageExist(String entityId, String pageId) => throw UnimplementedError();
}
