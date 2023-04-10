import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../domain/page/logic/bloc/page_bloc/page_bloc.dart';
import '../../domain/page/logic/provider/entity_page_api.dart';
import 'db_extension.dart';
import 'tools.dart';

class MockEntityPageApi extends MockApi implements PageApi {
  MockEntityPageApi({
    required this.dbService,
  });

  @override
  final DbService dbService;

  @override
  Future<Json> fetchPageData(Model model, String id, List<String> subset) async {
    try {
      await networkDelay();
      final List<Json> data = await fetchFullList(model);
      final Json targetPage = data.firstWhere((Json dataRow) => dataRow[model.idField.id].toString() == id);
      final Json response = <String, dynamic>{};
      for (final String field in subset) {
        response[field] = targetPage[field];
      }
      return response;
    } catch (error) {
      throw Exception('Not found page with id "$id" of model "${model.name}"');
    }
  }

  @override
  Future<Json> upsertPage(Model entity, String? id, Json pageData) async {
    await networkDelay();
    final Json effectivePage = <String, dynamic>{
      ...pageData,
    };
    bool isReallyNewPage = false;
    String effectiveId = id ?? '';
    final List<Json> data = await fetchFullList(entity);
    List<Json> effectiveData = [];
    if (effectivePage[entity.idField.id] == null || effectivePage[entity.idField.id].toString().trim() == '') {
      effectiveId = effectiveId.isEmpty ? Ulid().toUuid() : effectiveId;
      effectivePage[entity.idField.id] = effectiveId;
      isReallyNewPage = true;
    }
    if (effectiveId.isEmpty) {
      effectiveId = effectivePage[entity.idField.id] as String;
    }

    /// ? Remove all copies of this page (this is garbage local logic)
    if (isReallyNewPage == false) {
      effectiveData = await _clearFromDuplicates(entity, effectiveId, data);
    } else {
      effectiveData = data;
    }
    effectiveData.add(effectivePage);
    effectiveData.sort((Json first, Json second) => (first[entity.idField.id] as String).compareTo(second[entity.idField.id] as String));
    await saveFullList(entity, effectiveData);
    return effectivePage;
  }

  @override
  Future<void> deletePage(Model model, String pageId) async {
    await networkDelay();
    final List<Json> data = await fetchFullList(model);
    final List<Json> clearedData = data.where((Json page) => page[model.idField.id] != pageId).toList();
    await saveFullList(model, clearedData);
  }

  @override
  Future<void> saveThirdTable(ThirdTable thirdTable, String parentEntityId, List<String> childEntityIds) async {
    await networkDelay();
    final List<Json> thirdTableData = await fetchFullList(thirdTable.relationsEntity);
    thirdTableData.removeWhere((Json row) {
      return row[thirdTable.parentEntityIdName] == parentEntityId;
    });
    for (final ChildEntityDataId childId in childEntityIds) {
      thirdTableData.add(<String, dynamic>{
        thirdTable.parentEntityIdName: parentEntityId,
        thirdTable.childEntityIdName: childId,
      });
    }
    await saveFullList(thirdTable.relationsEntity, thirdTableData);
  }

  Future<List<Json>> _clearFromDuplicates(Model entity, String id, List<Json> data) async {
    final List<Json> clearData = [];
    final Set<int> indexesForDeletion = {};
    for (int i = 0; i < data.length; i++) {
      final Json page = data[i];
      if (page[entity.idField.id] == id) {
        indexesForDeletion.add(i);
      }
      await wait();
    }
    for (int i = 0; i < data.length; i++) {
      final Json page = data[i];
      if (!indexesForDeletion.contains(i)) {
        clearData.add(page);
      }
      await wait();
    }
    return clearData;
  }
}
