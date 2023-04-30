import 'package:cms/cms.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import 'db_extension.dart';
import 'tools.dart';

class PageListApiImplementation extends MockApi implements PageListApi {
  PageListApiImplementation({
    required this.dbService,
  });

  @override
  DbService dbService;

  @override
  Future<PageListResponseDto> fetchPageList(Model entity, List<String> subset, QueryDto query, ParamsDto params) async {
    await networkDelay();
    final List<Json> rawData = await fetchFullList(entity);

    final List<Json> requiredData = rawData.map((Json dataRow) {
      final Json fragment = <String, dynamic>{};
      for (final String field in subset) {
        fragment[field] = dataRow[field];
      }
      return fragment;
    }).toList();

    final List<Json> filteredData = requiredData.where((Json dataRow) {
      if (query.multipleValues.isEmpty && query.singleValues.isEmpty) {
        return true;
      }
      // TODO(alphamikle): This is a very simple realization. When will be implemented a custom queries logic - need to made more complexity here
      for (final QuerySingleParameter singleParameter in query.singleValues) {
        final String name = singleParameter.name;
        final dynamic value = singleParameter.value.value;
        if (dataRow[name] == value) {
          return true;
        } else if (dataRow[name].toString().toLowerCase().contains(value.toString().toLowerCase())) {
          return true;
        }
      }
      for (final QueryMultipleParameter multipleParameter in query.multipleValues) {
        final String name = multipleParameter.name;
        for (final QueryParameterValue queryParameterValue in multipleParameter.values) {
          final dynamic value = queryParameterValue.value;
          if (dataRow[name] == value) {
            return true;
          } else if (dataRow[name].toString().toLowerCase().contains(value.toString().toLowerCase())) {
            return true;
          }
        }
      }
      return false;
    }).toList();

    int page = params.page;
    if (page > (filteredData.length / params.limit).round()) {
      page = (filteredData.length / params.limit).round();
    } else if (page < 1) {
      page = 1;
    }
    final List<Json> chunk = filteredData.sublist((page - 1) * params.limit, (page * params.limit));
    final int totalPages = (filteredData.length / params.limit).round();
    return PageListResponseDto(
      page: page,
      totalPages: totalPages,
      data: chunk,
    );
  }
}
