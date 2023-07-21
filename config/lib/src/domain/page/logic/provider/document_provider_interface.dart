import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../fields/logic/third_table.dart';

abstract class IDocumentProvider {
  Future<Json> fetchDocument({required Model model, required DocumentId documentId, List<FieldId> subset = const []});

  Future<Json> saveDocument({required Model model, required DocumentId documentId, required Json data});

  Future<Json> createDocument({required Model model, required Json data});

  Future<Json> upsertDocument({required Model model, required DocumentId? documentId, required Json data});

  Future<void> saveThirdTable({required ThirdTable thirdTable, required FieldId parentModelFieldId, required List<FieldId> childModelFieldIds});

  Future<void> deletePage({required Model model, required DocumentId documentId});
}
