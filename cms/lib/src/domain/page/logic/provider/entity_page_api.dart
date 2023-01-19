import 'package:cms/src/domain/page/logic/bloc/page_bloc/page_bloc.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class PageApi {
  Future<Json> fetchPageData(Model entity, String id, List<String> subset);

  Future<Json> upsertPage(Model entity, String? id, Json pageData);

  Future<void> saveThirdTable(ThirdTable thirdTable, ParentEntityDataId parentEntityId, List<ChildEntityDataId> childEntityIds);

  Future<void> deletePage(Model model, String pageId);
}
