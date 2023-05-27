import 'dart:convert';

import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

class ModelProvider {
  ModelProvider({
    required this.pageProvider,
    required this.collectionProvider,
    required this.modelApi,
  });

  final IPageProvider pageProvider;
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
  }) async {
    final String modelId = oldModel.id;
    final Json modelJson = newModel.toJson();

    /// ? We will not allow to change an id of the existed model
    modelJson[newModel.idField.id] = modelId;
    final String generatedModelId = generateModelId(oldModel.id);
    final String secretModelId = await encrypt(generatedModelId);
    final Json result = await pageProvider.saveEditedPage(
      entity: modelModel,
      id: secretModelId,
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

  Future<Model> createModel(Model newModel) async => saveModel(oldModel: newModel, newModel: newModel);
}
