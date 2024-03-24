import '../../../model/logic/model/model_interface.dart';
import '../dto/collection_response_dto.dart';
import '../dto/params_dto.dart';
import '../query_language/fields/query_field.dart';

abstract class ICollectionProvider {
  Future<CollectionResponseDto> fetchPageList({
    required covariant IModel model,
    List<String> subset = const [],
    QueryField? query,
    ParamsDto? params,
  });
}
