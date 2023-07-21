import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../fields/logic/third_table.dart';

abstract class IDocumentApi {
  Future<Json> fetchPageData(Model model, DocumentId documentId, List<FieldId> subset);

  Future<Json> upsertPage(Model model, DocumentId? documentId, Json pageData);

  Future<void> saveThirdTable(ThirdTable thirdTable, FieldId parentModelFieldId, List<FieldId> childModelFieldIds);

  Future<void> deletePage(Model model, DocumentId documentId);
}
