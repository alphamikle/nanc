import 'dart:convert';

import 'package:config/config.dart';
import 'package:model/model.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:tools/tools.dart';

class ModelProvider {
  ModelProvider({
    required this.pageProvider,
    required this.collectionProvider,
    required this.modelApi,
  });

  final IDocumentProvider pageProvider;
  final ICollectionProvider collectionProvider;
  final IModelApi modelApi;

  Future<List<Model>> fetchModels() async {
    final CollectionResponseDto result = await collectionProvider.fetchPageList(
      model: modelModel,
      subset: [
        fieldIdProperty,
        kModelField,
      ],
      params: ParamsDto(
        page: 1,

        /// ? We always want to download all the models
        limit: 49990,
        sort: Sort(
          fieldId: modelModel.idField.id,
          order: Order.asc,
        ),
      ),
    );
    final List<Json> models = result.data;
    final List<Model> response = [];
    for (int i = 0; i < models.length; i++) {
      final Json encodedModel = models[i];
      final String encryptedModelId = encodedModel[fieldIdProperty] as String;
      final String encryptedModelJson = encodedModel[kModelField] as String;
      final String decryptedModelId = await decrypt(encryptedModelId);
      final Json decryptedModelJson = castToJson(jsonDecode(await decrypt(encryptedModelJson, salt: decryptedModelId)));
      response.add(Model.fromJson(decryptedModelJson));
      await wait();
    }
    return response;
  }

  Future<Model?> findModelById(String modelId) async {
    final List<Model> models = await fetchModels();
    final Model? model = models.firstWhereOrNull((Model it) => it.id == modelId);
    return model;
  }

  Future<Model> saveModel({
    required Model oldModel,
    required Model newModel,
    bool needToDeleteOldModel = false,
  }) async {
    if (needToDeleteOldModel) {
      await deleteModel(oldModel);
    }
    final Json modelJson = newModel.toJson();
    final String generatedModelId = generateModelId(newModel.id);
    final String secretModelId = await encrypt(generatedModelId);
    final Json result = await pageProvider.saveDocument(
      model: modelModel,
      documentId: secretModelId,
      data: await generateModelJson(
        id: secretModelId,
        model: await encrypt(jsonEncode(modelJson), salt: generatedModelId),
      ),
    );
    final String encryptedModelId = result[modelModel.idField.id] as String;
    final String encryptedModelJson = result[kModelField] as String;
    final String decryptedModelId = await decrypt(encryptedModelId);
    final Json decryptedModelJson = castToJson(jsonDecode(await decrypt(encryptedModelJson, salt: decryptedModelId)));
    await modelApi.createModelRelatedTable(newModel, newModel == oldModel ? null : oldModel);
    return Model.fromJson(decryptedModelJson);
  }

  Future<void> deleteModel(Model model) async {
    final String secretModelId = await _generateSecretModelId(model.id);
    await modelApi.deleteModel(model);
    await pageProvider.deletePage(model: modelModel, documentId: secretModelId);
  }

  Future<Model> createModel(Model newModel) async => saveModel(oldModel: newModel, newModel: newModel);

  Future<String> _generateSecretModelId(ModelId modelId) async {
    return encrypt(generateModelId(modelId));
  }
}
