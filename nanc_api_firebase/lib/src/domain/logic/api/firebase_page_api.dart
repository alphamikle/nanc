import 'package:config/config.dart';
import 'package:googleapis/firestore/v1.dart' as fs;
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../nanc_api_firebase.dart';
import '../mapper/firestore_value_mapper.dart';

class FirebasePageApi implements IDocumentApi {
  FirebasePageApi({
    required FirebaseApi api,
    required IFirebaseCollectionApi firebaseCollectionApi,
  })  : _api = api,
        _collectionApi = firebaseCollectionApi;

  final FirebaseApi _api;
  final IFirebaseCollectionApi _collectionApi;

  @override
  Future<void> deletePage(Model model, String pageId) async {
    _api.notifyAboutChanges(model);
    await _api.deleteDocument(modelId: model.id, pageId: pageId);
  }

  @override
  Future<Json> fetchPageData(Model model, String id, List<String> subset) async {
    final fs.Document document = await _api.getDocument(modelId: model.id, pageId: id);
    return documentToJson(model, document);
  }

  @override
  Future<void> saveThirdTable(ThirdTable thirdTable, FieldId parentModelId, List<FieldId> childModelIds) async {
    _api.notifyAboutChanges(thirdTable.relationsEntity);
    final CollectionResponseDto oldRelations = await _collectionApi.fetchPageList(
      thirdTable.relationsEntity,
      thirdTable.relationsEntity.flattenFields.ids,
      QueryValueField(
        fieldId: thirdTable.parentEntityIdName,
        value: parentModelId,
        type: QueryFieldType.equals,
      ),
      ParamsDto(
        page: 1,
        limit: 49999,
        sort: Sort(fieldId: thirdTable.relationsEntity.idField.id, order: Order.asc),
      ),
    );
    final Set<FieldId> childIds = childModelIds.toSet();
    final List<FieldId> idsForDeletion = oldRelations.data
        .map((Json row) => row[thirdTable.relationsEntity.idField.id].toString())
        .where((FieldId id) => childIds.contains(id) == false)
        .toList();
    for (final FieldId childId in idsForDeletion) {
      await deletePage(thirdTable.relationsEntity, childId);
    }
    for (final FieldId childId in childModelIds) {
      final String uuid = Ulid().toUuid();
      await upsertPage(thirdTable.relationsEntity, uuid, {
        thirdTable.relationsEntity.idField.id: uuid,
        thirdTable.parentEntityIdName: parentModelId,
        thirdTable.childEntityIdName: childId,
      });
    }
  }

  @override
  Future<Json> upsertPage(Model model, String? id, Json pageData) async {
    _api.notifyAboutChanges(model);
    final fs.Document document = await _api.upsertDocument(modelId: model.id, pageId: id ?? pageData[model.idField.id], data: pageData);
    return documentToJson(model, document);
  }
}
