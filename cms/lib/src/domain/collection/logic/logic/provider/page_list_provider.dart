import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../dto/params_dto.dart';
import '../dto/query_dto.dart';
import 'page_list_api.dart';
import 'page_list_provider_interface.dart';

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
