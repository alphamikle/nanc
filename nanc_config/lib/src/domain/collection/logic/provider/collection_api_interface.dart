import 'package:model/model.dart';

import '../dto/collection_response_dto.dart';
import '../dto/params_dto.dart';
import '../dto/query_dto.dart';

abstract class ICollectionApi {
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryDto query, ParamsDto params);
}
