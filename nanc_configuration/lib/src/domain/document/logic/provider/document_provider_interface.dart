import 'package:nanc_tools/nanc_tools.dart';

import '../../../field/logic/model/third_table_interface.dart';
import '../../../model/logic/model/model_interface.dart';

abstract class IDocumentProvider {
  Future<Json> fetchDocument({required covariant IModel model, required DocumentId documentId, List<FieldId> subset = const []});

  Future<Json> saveDocument({required covariant IModel model, required DocumentId documentId, required Json data});

  Future<Json> createDocument({required covariant IModel model, required Json data});

  Future<Json> upsertDocument({required covariant IModel model, required DocumentId? documentId, required Json data});

  Future<void> saveThirdTable({required covariant IThirdTable thirdTable, required FieldId parentModelFieldId, required List<FieldId> childModelFieldIds});

  Future<void> deletePage({required covariant IModel model, required DocumentId documentId});
}
