import 'package:model/model.dart';

import '../dto/page_list_response_dto.dart';
import '../dto/params_dto.dart';
import '../dto/query_dto.dart';

abstract class PageListApi {
  Future<PageListResponseDto> fetchPageList(Model model, List<String> subset, QueryDto query, ParamsDto params);
}
