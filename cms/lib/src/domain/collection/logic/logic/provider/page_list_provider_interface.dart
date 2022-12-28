import 'package:cms/src/domain/collection/logic/logic/dto/params_dto.dart';
import 'package:cms/src/domain/collection/logic/logic/dto/query_dto.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class PageListProviderInterface {
  Future<List<Json>> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto params = const ParamsDto.initial(),
  });
}
