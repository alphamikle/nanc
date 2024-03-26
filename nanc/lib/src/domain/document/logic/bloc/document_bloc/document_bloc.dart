import 'dart:convert';

import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../../service/errors/human_exception.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../provider/document_provider.dart';
import '../base_document_bloc/base_document_bloc.dart';
import 'document_state.dart';

enum DocumentEvent {
  documentChanged,
}

class DocumentBloc extends BaseDocumentBloc<DocumentState> {
  DocumentBloc({
    required this.modelCollectionBloc,
    required this.documentProvider,
    required this.eventBus,
    required super.draftService,
  }) : super(state: DocumentState.empty());

  final ModelListBloc modelCollectionBloc;
  final IDocumentProvider documentProvider;
  final EventBus eventBus;

  Future<void> loadPage(ModelId modelId, DocumentId documentId) async {
    try {
      this.modelId = modelId;
      this.documentId = documentId;
      emit(state.copyWith(isLoading: true, isError: false));
      await wait(duration: const Duration(milliseconds: 50));
      final Model? model = await modelCollectionBloc.tryToFindModelByIdChecked(modelId);
      if (model == null) {
        notFoundModelError(modelId);
      }
      final bool draftResult = await _preloadDraft(modelId);
      if (draftResult) {
        return;
      }
      final Json data = await loadPageData(model: model, documentId: documentId);
      final Json dynamicStructure = await _loadDynamicStructure(model: model, documentId: documentId);
      final TextControllerMap controllerMap = _mapDocumentDataToControllerMap(modelId, data);
      data.addAll(dynamicStructure);
      emit(state.copyWith(
        data: data,
        initialData: clone(data),
        controllerMap: controllerMap,
        thirdTableData: {},
        thirdTable: {},
        isLoading: false,
      ));
    } catch (error, stackError) {
      emit(state.copyWith(isLoading: false, isError: true));
      throw [error, stackError].toHumanException('Page "$documentId" loading failed!');
    }
  }

  Future<void> save(Model model) async {
    emit(state.copyWith(isSaving: true, isError: false));
    try {
      final Json savedData = await documentProvider.saveDocument(
        model: model,
        documentId: state.data[model.idField.id].toString(),
        data: _updateCreatedAtOrUpdatedAtFields(model, _clearData(state.data, model)),
      );
      await _saveThirdTableData();
      await _upsertDynamicFieldStructures(
        documentId: state.data[model.idField.id].toString(),
        data: state.data,
        creation: false,
      );
      await _deleteDraft();
      emit(state.copyWith(
        data: savedData,
        initialData: clone(savedData),
        thirdTableData: {},
        controllerMap: _remapDocumentDataToControllerMap(model.id, savedData),
        isSaving: false,
      ));
      eventBus.send(eventId: DocumentEvent.documentChanged, request: model);
    } catch (error, stackTrace) {
      emit(state.copyWith(isSaving: false));
      throw [error, stackTrace].toHumanException('Document saving failed!');
    }
  }

  Future<void> create(Model model) async {
    emit(state.copyWith(isSaving: true, isError: false));
    try {
      final Json savedData = await documentProvider.createDocument(
        model: model,
        data: _updateCreatedAtOrUpdatedAtFields(model, _clearData(state.data, model)),
      );
      await _saveThirdTableData();
      await _upsertDynamicFieldStructures(
        documentId: savedData[model.idField.id].toString(),
        data: state.data,
        creation: true,
      );
      await _deleteDraft();
      emit(state.copyWith(
        data: savedData,
        initialData: clone(savedData),
        thirdTableData: {},
        isSaving: false,
      ));
      eventBus.send(eventId: DocumentEvent.documentChanged, request: model);
    } catch (error) {
      emit(state.copyWith(isSaving: false));
      throw error.toHumanException('Document creation failed!');
    }
  }

  Future<void> _saveThirdTableData() async {
    for (final MapEntry<ModelId, Map<FieldId, List<FieldId>>> thirdTableEntry in state.thirdTableData.entries) {
      await documentProvider.saveThirdTable(
        thirdTable: state.thirdTable[thirdTableEntry.key] ?? ThirdTable.empty(),
        parentModelFieldId: thirdTableEntry.value.keys.first,
        childModelFieldIds: thirdTableEntry.value.values.first,
      );
    }
  }

  Future<void> delete(Model model) async {
    emit(state.copyWith(isDeleting: true, isError: false));
    try {
      await documentProvider.deletePage(model: model, documentId: state.data[model.idField.id].toString());
      await _deleteDraft();
      modelId = null;
      documentId = null;
      emit(state.copyWith(isDeleting: false));
      eventBus.send(eventId: DocumentEvent.documentChanged, request: model);
    } catch (error) {
      emit(state.copyWith(isDeleting: false));
      throw error.toHumanException('Page deletion failed!');
    }
  }

  Future<void> reset(Model model) async {
    await _deleteDraft();
  }

  Future<void> prepareForCreation(ModelId modelId) async {
    this.modelId = modelId;
    documentId = null;
    emit(state.copyWith(isLoading: true));
    emit(DocumentState.empty());
    final Model? model = modelCollectionBloc.tryToFindModelById(modelId);
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
    final TextControllerMap controllerMap = _mapDocumentDataToControllerMap(modelId, pageData);
    emit(DocumentState.optional(
      data: pageData,
      initialData: clone(pageData),
      controllerMap: controllerMap,
      isLoading: false,
    ));
  }

  Future<bool> isPageExist(ModelId modelId, DocumentId documentId) async {
    try {
      await loadPageData(modelId: modelId, documentId: documentId);
      return true;
    } catch (error) {
      return false;
    }
  }

  void updateThirdTableValue(ThirdTable thirdTable, Map<FieldId, List<FieldId>> thirdTableData) {
    emit(state.copyWith(
      thirdTable: {
        ...state.thirdTable,
        thirdTable.relationsEntity.id: thirdTable,
      },
    ));
    emit(state.copyWith.thirdTableData({
      ...state.thirdTableData,
      thirdTable.relationsEntity.id: thirdTableData,
    }));
  }

  bool hasThirdTableData(ModelId modelId) => state.thirdTableData.containsKey(modelId);

  Future<bool> _preloadDraft(ModelId modelId) async {
    try {
      if (draftKey != null && await draftService.haveDraft(draftKey!)) {
        final DocumentState draftState = DocumentState.fromJson(await draftService.getDraft(draftKey!));
        final TextControllerMap controllerMap = _mapDocumentDataToControllerMap(modelId, draftState.data);
        emit(draftState.copyWith(
          isLoading: false,
          controllerMap: controllerMap,
          isError: false,
        ));
        return true;
      }
      return false;
    } catch (error) {
      await draftService.deleteDraft(draftKey!);
      emit(state.copyWith(
        isLoading: false,
        isError: false,
      ));
      return false;
    }
  }

  Json _clearData(Json json, Model model) {
    final Json clearData = <String, dynamic>{...json};
    final List<String> keys = clearData.keys.toList();
    for (final String key in keys) {
      if (isStructureField(key)) {
        clearData.remove(key);
      }
    }
    final Set<String> modelRealFieldsIds = model.flattenFields.realIds.toSet();
    final Set<String> fieldsForDeletion = {};
    for (final MapEntry(:String key) in clearData.entries) {
      if (modelRealFieldsIds.contains(key) == false) {
        fieldsForDeletion.add(key);
      }
    }
    for (final FieldId fieldId in fieldsForDeletion) {
      clearData.remove(fieldId);
    }
    return clearData;
  }

  Future<Json> loadPageData({
    required DocumentId documentId,
    Model? model,
    ModelId? modelId,
  }) async {
    assert(model != null || modelId != null);
    await wait(duration: const Duration(milliseconds: 50));
    final Model? effectiveModel = model ?? modelCollectionBloc.tryToFindModelById(modelId!);
    if (effectiveModel == null) {
      notFoundModelError(modelId ?? model!.id);
    }
    final Json data = await documentProvider.fetchDocument(
      model: effectiveModel,
      documentId: documentId,
      subset: effectiveModel.flattenFields.realIds,
    );
    return data;
  }

  Future<void> _upsertDynamicFieldStructures({
    required DocumentId documentId,
    required Json data,
    required bool creation,
  }) async {
    final List<String> structureFields = data.keys.where((String key) => isStructureField(key)).toList();
    if (structureFields.isNotEmpty) {
      for (final String key in structureFields) {
        final String structureId = await encrypt(generateStructurePageId(key, documentId));
        final Json structure = await generateStructureJson(id: structureId, structure: data[key]);
        await documentProvider.upsertDocument(
          model: structureModel,
          documentId: structureId,
          data: structure,
        );
      }
    }
  }

  Future<Json> _loadDynamicStructure({
    required Model model,
    required DocumentId documentId,
  }) async {
    if (model.dynamicFields.isEmpty) {
      return <String, dynamic>{};
    }
    final Json result = <String, dynamic>{};
    for (final String dynamicField in model.dynamicFields) {
      final String structureId = await encrypt(generateStructurePageId(generateStructureFieldId(dynamicField), documentId));
      try {
        final Json dynamicStructure = await documentProvider.fetchDocument(
          model: structureModel,
          documentId: structureId,
          subset: structureModel.flattenFields.map((Field field) => field.id).toList(),
        );
        final String encryptedStructureString = await decrypt(dynamicStructure[kStructureField] as String);
        final dynamic encryptedStructureJson = jsonDecode(encryptedStructureString);
        result[generateStructureFieldId(dynamicField)] = encryptedStructureJson;
      } catch (error, stackTrace) {
        // Handle error
        logError('NOT FOUND A DYNAMIC FIELD FOR THE PAGE ID: $documentId OF MODEL: $model', error: error, stackTrace: stackTrace);
      }
    }
    return result;
  }

  TextControllerMap _mapDocumentDataToControllerMap(ModelId modelId, Json data) {
    final TextControllerMap controllerMap = {};
    for (final MapEntry<FieldId, dynamic> entry in data.entries) {
      final dynamic value = entry.value;
      final bool isNull = value == null;
      controllerMap[entry.key] = TextEditingController(text: isNull ? '' : value.toString());
    }
    return controllerMap;
  }

  TextControllerMap _remapDocumentDataToControllerMap(ModelId modelId, Json data) {
    final TextControllerMap controllerMap = {};
    for (final MapEntry<String, dynamic> entry in data.entries) {
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
    final List<DateTimeField> dateTimeFields = model.flattenFields.whereType<DateTimeField>().toList();
    if (dateTimeFields.isNotEmpty) {
      for (final DateTimeField field in dateTimeFields) {
        final dynamic currentValue = data[field.id];
        if (field.isCreatedAtField && (currentValue == null || currentValue == '') || field.isUpdatedAtField) {
          data[field.id] = DateTime.now().toIso8601String();
        }
      }
    }
    return data;
  }
}

mixin EntityPageBlocStub implements DocumentBloc {
  @override
  Future<void> create(Model model) => throw UnimplementedError();

  @override
  ModelListBloc get modelCollectionBloc => throw UnimplementedError();

  @override
  DocumentProvider get documentProvider => throw UnimplementedError();

  @override
  EventBus get eventBus => throw UnimplementedError();

  @override
  bool hasThirdTableData(ModelId entityId) => throw UnimplementedError();

  @override
  Future<void> loadPage(ModelId modelId, DocumentId pageId) => throw UnimplementedError();

  @override
  Future<void> prepareForCreation(ModelId modelId) => throw UnimplementedError();

  @override
  Future<void> save(Model model) => throw UnimplementedError();

  @override
  void updateThirdTableValue(ThirdTable thirdTable, Map<FieldId, List<FieldId>> thirdTableData) {}

  @override
  Future<bool> isPageExist(ModelId modelId, DocumentId documentId) => throw UnimplementedError();
}
