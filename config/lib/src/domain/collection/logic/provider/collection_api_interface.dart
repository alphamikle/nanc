import '../../../model/logic/model/model_interface.dart';
import '../dto/collection_response_dto.dart';
import '../dto/params_dto.dart';
import '../query_language/fields/query_field.dart';

abstract interface class ICollectionApi {
  Future<CollectionResponseDto> fetchPageList(covariant IModel model, List<String> subset, QueryField query, ParamsDto params);

  Set<QueryFieldType> get supportedFilters;
}
