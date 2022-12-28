import 'package:cms/src/domain/page/logic/bloc/page_bloc/entity_page_bloc.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class PageProviderInterface {
  Future<Json> fetchEntityPageData({
    required Model entity,
    required String id,
    List<String> subset = const [],
  });

  Future<Json> saveEditedEntityPage({required Model entity, required String id, required Json data});

  Future<Json> createEntityPage({required Model entity, required Json data});

  Future<Json> upsertPage({
    required Model entity,
    required String? id,
    required Json data,
  });

  Future<void> saveThirdTable({
    required ThirdTable thirdTable,
    required ParentEntityDataId parentEntityId,
    required List<ChildEntityDataId> childEntityIds,
  });

  Future<void> deletePage({required Model model, required String pageId});
}
