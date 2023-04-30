import 'package:model/model.dart';

import '../dto/page_list_response_dto.dart';
import '../dto/params_dto.dart';
import '../dto/query_dto.dart';

abstract class PageListProviderInterface {
  Future<PageListResponseDto> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto? params,
  });
}
