import 'package:cms/src/domain/collection/logic/logic/dto/params_dto.dart';
import 'package:cms/src/domain/collection/logic/logic/dto/query_dto.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class PageListApi {
  Future<List<Json>> fetchPageList(Model model, List<String> subset, QueryDto query, ParamsDto params);
}
