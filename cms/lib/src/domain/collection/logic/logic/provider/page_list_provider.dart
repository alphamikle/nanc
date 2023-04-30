import 'package:model/model.dart';

import '../dto/page_list_response_dto.dart';
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
  Future<PageListResponseDto> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto? params,
  }) async {
    return api.fetchPageList(model, subset, query, params ?? ParamsDto.initial(model));
  }
}
