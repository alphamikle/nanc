import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';

class CollectionProvider implements ICollectionProvider {
  CollectionProvider({
    required this.api,
  });

  final ICollectionApi api;

  @override
  Future<CollectionResponseDto> fetchPageList({
    required Model model,
    List<String> subset = const [],
    QueryDto query = const QueryDto(),
    ParamsDto? params,
  }) async {
    return api.fetchPageList(model, subset, query, params ?? ParamsDto.initial(model));
  }
}
