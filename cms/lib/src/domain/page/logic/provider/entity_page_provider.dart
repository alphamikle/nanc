import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../bloc/page_bloc/page_bloc.dart';
import 'entity_page_api.dart';
import 'entity_page_provider_interface.dart';

class PageProvider implements PageProviderInterface {
  PageProvider({
    required this.api,
  });

  final PageApi api;

  @override
  Future<Json> fetchPageData({
    required Model model,
    required String id,
    List<String> subset = const [],
  }) async {
    /// ? Solo pages should always have the same ID as their Models
    return api.fetchPageData(model, model.isCollection ? id : model.id, subset);
  }

  @override
  Future<Json> saveEditedPage({required Model entity, required String id, required Json data}) => upsertPage(entity: entity, id: id, data: data);

  @override
  Future<Json> createPage({required Model entity, required Json data}) => upsertPage(entity: entity, id: null, data: data);

  @override
  Future<Json> upsertPage({
    required Model entity,
    required String? id,
    required Json data,
  }) {
    /// ? Replace page id for any solo Model
    if (entity.isCollection == false) {
      data[entity.idField.id] = entity.id;
    }

    /// ? Solo pages should always have the same ID as their Models
    return api.upsertPage(entity, entity.isCollection ? id : entity.id, data);
  }

  @override
  Future<void> saveThirdTable({
    required ThirdTable thirdTable,
    required ParentEntityDataId parentEntityId,
    required List<ChildEntityDataId> childEntityIds,
  }) async {
    // TODO(alphamikle): Try to create method on the existing page methods
    await api.saveThirdTable(thirdTable, parentEntityId, childEntityIds);
  }

  @override
  Future<void> deletePage({required Model model, required String pageId}) async {
    await api.deletePage(model, pageId);
  }
}
