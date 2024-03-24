import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tools/tools.dart';

import 'supabase_api.dart';

class SupabaseDocumentApi implements IDocumentApi {
  SupabaseDocumentApi({
    required SupabaseApi api,
  }) : _api = api;

  final SupabaseApi _api;

  @override
  Future<Json> fetchPageData(Model model, String id, List<String> subset) async {
    try {
      final PostgrestFilterBuilder<dynamic> selection = _api.getSelection(model: model, subset: subset);
      final PostgrestResponse<dynamic> response = await selection.eq(model.idField.id, id).single();
      if (response.data is DJson) {
        return castToJson(response.data);
      }
      throw Exception('Incorrect response');
    } catch (error, stackTrace) {
      if (error is PostgrestException && error.details == 'Bad Request' && subset.isNotEmpty) {
        /// Possibly, that error means, that some of fields in the subset don't exists at the table
        return fetchPageData(model, id, []);
      }
      logError('Error on loading supabase document', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  // TODO(alphamikle): Handle multiple ids
  @override
  Future<void> deletePage(Model model, String id) async => await _api.getBuilder(model).delete().eq(model.idField.id, id);

  @override
  Future<void> saveThirdTable(ThirdTable thirdTable, FieldId parentModelId, List<FieldId> childModelIds) async {
    final Model relationsModel = thirdTable.relationsEntity;
    final SupabaseQueryBuilder builder = _api.getBuilder(relationsModel);
    final Field? primaryIdField = relationsModel.flattenFields.firstWhereOrNull(
      (Field field) => field is IdField && field.id != thirdTable.parentEntityIdName && field.id != thirdTable.childEntityIdName,
    );
    final Set<FieldId> oldChildrenIds = (await _getOldThirdTableChildrenIds(thirdTable, parentModelId)).toSet();
    final Set<FieldId> newChildrenIds = childModelIds.toSet();
    final List<FieldId> fieldsForDeletion = oldChildrenIds.where((FieldId id) => newChildrenIds.contains(id) == false).toList();

    await Future.wait(
      childModelIds.map(
        (String childId) => Future(
          () async {
            await builder.upsert({
              if (primaryIdField != null) primaryIdField.id: Ulid().toUuid(),
              thirdTable.parentEntityIdName: parentModelId,
              thirdTable.childEntityIdName: childId,
            });
          },
        ),
      ),
    );
    await _deleteOldChildrenIds(thirdTable, parentModelId, fieldsForDeletion);
  }

  @override
  Future<Json> upsertPage(Model model, String? id, Json pageData) async {
    final SupabaseQueryBuilder builder = _api.getBuilder(model);
    final List<Field> realFields = model.flattenFields.realFields;
    for (final Field field in realFields) {
      /// ? Nanc remove null-values from the data-object, but Supabase require them to able to set them to null in the DB
      if (pageData.containsKey(field.id) == false) {
        pageData[field.id] = null;
      }
    }
    PostgrestFilterBuilder updater = builder.upsert(pageData);
    if (id != null) {
      updater = updater.eq(model.idField.id, id);
    }
    final dynamic response = await updater.select(model.flattenFields.realIds.join(',')).single();
    if (response is DJson) {
      return castToJson(response);
    }
    throw Exception('Incorrect response');
  }

  Future<List<String>> _getOldThirdTableChildrenIds(ThirdTable thirdTable, String parentPageId) async {
    final Model relationsModel = thirdTable.relationsEntity;
    final PostgrestFilterBuilder<dynamic> selection = _api.getSelection(model: relationsModel, subset: []);
    final PostgrestResponse<dynamic> response = await selection.eq(thirdTable.parentEntityIdName, parentPageId);
    if (response.data is List<dynamic>) {
      return (response.data as List<dynamic>).map((dynamic row) {
        if (row is DJson) {
          return row[thirdTable.childEntityIdName].toString();
        }
        throw Exception('Incorrect response');
      }).toList();
    }
    throw Exception('Incorrect response');
  }

  Future<void> _deleteOldChildrenIds(ThirdTable thirdTable, String parentId, List<FieldId> ids) async {
    if (ids.isEmpty) {
      return;
    }
    final Model relationsModel = thirdTable.relationsEntity;
    await _api.getBuilder(relationsModel).delete().in_(thirdTable.childEntityIdName, ids).eq(thirdTable.parentEntityIdName, parentId);
  }
}
