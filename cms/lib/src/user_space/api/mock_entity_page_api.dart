import 'package:cms/src/domain/page/logic/bloc/page_bloc/entity_page_bloc.dart';
import 'package:cms/src/domain/page/logic/provider/entity_page_api.dart';
import 'package:cms/src/user_space/api/db_extension.dart';
import 'package:cms/src/user_space/api/tools.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class MockEntityPageApi extends MockApi implements PageApi {
  MockEntityPageApi({
    required this.dbService,
  });

  @override
  final DbService dbService;

  @override
  Future<Json> fetchPageData(Model entity, String id, List<String> subset) async {
    try {
      await networkDelay();
      final List<Json> data = await fetchFullList(entity);
      final Json targetEntity = data.firstWhere((Json dataRow) => dataRow[entity.idField.id] == id);
      final Json response = <String, dynamic>{};
      for (final String field in subset) {
        response[field] = targetEntity[field];
      }
      return response;
    } catch (error) {
      throw Exception('Not found page with id "$id" of model "$entity"');
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
