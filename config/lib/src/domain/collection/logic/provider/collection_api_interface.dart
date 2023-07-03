import 'package:model/model.dart';

import '../dto/collection_response_dto.dart';
import '../dto/params_dto.dart';
import '../query_language/fields/query_field.dart';

abstract interface class ICollectionApi {
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params);

  Set<QueryFieldType> get supportedFilters;
}
