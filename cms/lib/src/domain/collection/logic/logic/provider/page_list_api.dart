import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../dto/params_dto.dart';
import '../dto/query_dto.dart';

abstract class PageListApi {
  Future<List<Json>> fetchPageList(Model model, List<String> subset, QueryDto query, ParamsDto params);
}
