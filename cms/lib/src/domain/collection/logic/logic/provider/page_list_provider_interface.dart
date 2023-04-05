import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../dto/params_dto.dart';
import '../dto/query_dto.dart';

abstract class PageListProviderInterface {
  Future<List<Json>> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto params = const ParamsDto.initial(),
  });
}
