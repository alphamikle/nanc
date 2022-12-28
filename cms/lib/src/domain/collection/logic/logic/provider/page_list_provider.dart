import 'package:cms/src/domain/collection/logic/logic/dto/params_dto.dart';
import 'package:cms/src/domain/collection/logic/logic/dto/query_dto.dart';
import 'package:cms/src/domain/collection/logic/logic/provider/page_list_api.dart';
import 'package:cms/src/domain/collection/logic/logic/provider/page_list_provider_interface.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class PageListProvider implements PageListProviderInterface {
  PageListProvider({
    required this.api,
  });

  final PageListApi api;

  @override
  Future<List<Json>> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto params = const ParamsDto.initial(),
  }) async {
    return api.fetchPageList(model, subset, query, params);
  }
}
