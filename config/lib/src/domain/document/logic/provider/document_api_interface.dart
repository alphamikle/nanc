import 'package:tools/tools.dart';

import '../../../field/logic/model/third_table_interface.dart';
import '../../../model/logic/model/model_interface.dart';

abstract class IDocumentApi {
  Future<Json> fetchPageData(covariant IModel model, DocumentId documentId, List<FieldId> subset);

  Future<Json> upsertPage(covariant IModel model, DocumentId? documentId, Json pageData);

  Future<void> saveThirdTable(covariant IThirdTable thirdTable, FieldId parentModelFieldId, List<FieldId> childModelFieldIds);

  Future<void> deletePage(covariant IModel model, DocumentId documentId);
}
