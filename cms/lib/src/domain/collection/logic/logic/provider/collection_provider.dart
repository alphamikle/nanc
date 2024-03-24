import 'package:config/config.dart';
import 'package:model/model.dart';

class CollectionProvider implements ICollectionProvider {
  CollectionProvider({
    required this.api,
  });

  final ICollectionApi api;

  @override
  Future<CollectionResponseDto> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryField? query,
    ParamsDto? params,
  }) async {
    return api.fetchPageList(
      model,
      subset,
      query ?? const QueryOrField(),
      params ??
          ParamsDto(
            page: 1,
            limit: NetworkConfig.paginationLimitParameterDefaultValue,
            sort: Sort(fieldId: model.idField.id, order: Order.asc),
          ),
    );
  }
}
