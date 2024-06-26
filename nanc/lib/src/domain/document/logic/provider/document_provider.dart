import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../field/logic/third_table/third_table.dart';
import '../../../model/logic/model/logic/model.dart';

class DocumentProvider implements IDocumentProvider {
  DocumentProvider({
    required this.api,
  });

  final IDocumentApi api;

  @override
  Future<Json> fetchDocument({
    required Model model,
    required DocumentId documentId,
    List<FieldId> subset = const [],
  }) async {
    /// ? Solo pages should always have the same ID as their Models
    return api.fetchPageData(model, model.isCollection ? documentId : model.id, subset);
  }

  @override
  Future<Json> saveDocument({required Model model, required DocumentId documentId, required Json data}) => upsertDocument(
        model: model,
        documentId: documentId,
        data: data,
      );

  @override
  Future<Json> createDocument({required Model model, required Json data}) => upsertDocument(model: model, documentId: null, data: data);

  @override
  Future<Json> upsertDocument({
    required Model model,
    required DocumentId? documentId,
    required Json data,
  }) {
    /// ? Replace page id for any solo Model
    if (model.isCollection == false) {
      data[model.idField.id] = model.id;
    }

    /// ? Solo pages should always have the same ID as their Models
    return api.upsertPage(model, model.isCollection ? documentId : model.id, data);
  }

  @override
  Future<void> saveThirdTable({
    required ThirdTable thirdTable,
    required FieldId parentModelFieldId,
    required List<FieldId> childModelFieldIds,
  }) async {
    // TODO(alphamikle): Try to create method on the existing page methods
    await api.saveThirdTable(thirdTable, parentModelFieldId, childModelFieldIds);
  }

  @override
  Future<void> deletePage({required Model model, required DocumentId documentId}) async {
    await api.deletePage(model, documentId);
  }
}
