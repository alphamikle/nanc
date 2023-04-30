import 'package:model/model.dart';

import '../dto/collection_response_dto.dart';
import '../dto/params_dto.dart';
import '../dto/query_dto.dart';

abstract class ICollectionProvider {
  Future<CollectionResponseDto> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto? params,
  });
}
