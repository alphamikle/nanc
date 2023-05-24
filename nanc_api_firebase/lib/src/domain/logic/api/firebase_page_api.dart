import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

class FirebasePageApi implements IPageApi {
  @override
  Future<void> deletePage(Model model, String pageId) {
    // TODO: implement deletePage
    throw UnimplementedError();
  }

  @override
  Future<Json> fetchPageData(Model model, String id, List<String> subset) {
    // TODO: implement fetchPageData
    throw UnimplementedError();
  }

  @override
  Future<void> saveThirdTable(ThirdTable thirdTable, ParentEntityDataId parentModelId, List<ChildEntityDataId> childModelIds) {
    // TODO: implement saveThirdTable
    throw UnimplementedError();
  }

  @override
  Future<Json> upsertPage(Model model, String? id, Json pageData) {
    // TODO: implement upsertPage
    throw UnimplementedError();
  }
}
