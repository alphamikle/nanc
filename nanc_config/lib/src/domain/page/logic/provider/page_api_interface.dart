import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../fields/logic/third_table.dart';

typedef ParentEntityDataId = String;
typedef ChildEntityDataId = String;

abstract class IPageApi {
  Future<Json> fetchPageData(Model model, String id, List<String> subset);

  Future<Json> upsertPage(Model model, String? id, Json pageData);

  Future<void> saveThirdTable(ThirdTable thirdTable, ParentEntityDataId parentModelId, List<ChildEntityDataId> childModelIds);

  Future<void> deletePage(Model model, String pageId);
}
