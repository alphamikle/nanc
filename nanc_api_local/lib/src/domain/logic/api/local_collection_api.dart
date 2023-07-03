import 'dart:math';

import 'package:config/config.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../service/db_extension.dart';
import '../../../service/tools.dart';

class LocalCollectionApi extends LocalApi implements ICollectionApi {
  LocalCollectionApi({
    required this.dbService,
  });

  @override
  DbService dbService;

  @override
  Future<CollectionResponseDto> fetchPageList(Model entity, List<String> subset, QueryField query, ParamsDto params) async {
    await networkDelay();
    final List<Json> rawData = await fetchFullList(entity);

    final List<Json> requiredData = rawData.map((Json dataRow) {
      final Json fragment = <String, dynamic>{};
      for (final String field in subset) {
        fragment[field] = dataRow[field];
      }
      return fragment;
    }).toList();

    final List<Json> filteredData = _searchEngine(requiredData, query);

    int page = params.page;
    if (page > (filteredData.length / params.limit).round()) {
      page = (filteredData.length / params.limit).round();
    } else if (page < 1) {
      page = 1;
    }
    final List<Json> chunk =
        params.limit <= filteredData.length ? filteredData.sublist((page - 1) * params.limit, min((page * params.limit), filteredData.length)) : filteredData;
    final int totalPages = (filteredData.length / params.limit).round();
    return CollectionResponseDto(
      page: page,
      totalPages: totalPages,
      data: chunk,
    );
  }

  @override
  Set<QueryFieldType> get supportedFilters => QueryFieldType.values.toSet();
}

List<Json> _searchEngine(List<Json> data, QueryField query) {
  return data.where((Json row) => _filterRow(row, query)).toList();
}

bool _filterRow(Json row, QueryField query) {
  if (query is QueryValueField) {
    return _filterByValue(row[query.fieldId], query.type, query.value);
  } else if (query is QueryOrField) {
    if (query.fields.isEmpty) {
      return true;
    }
    for (final QueryField childQuery in query.fields) {
      final isOk = _filterRow(row, childQuery);
      if (isOk) {
        return true;
      }
    }
    return false;
  } else if (query is QueryAndField) {
    if (query.fields.isEmpty) {
      return true;
    }
    for (final QueryField childQuery in query.fields) {
      final isOk = _filterRow(row, childQuery);
      if (isOk == false) {
        return false;
      }
    }
    return true;
  }
  return false;
}

bool _filterByValue(Object? rowValue, QueryFieldType type, Object? value) {
  final bool rowValueNotNull = rowValue != null;
  final bool queryValueNotNull = value != null;

  final bool rowValueIsNumber = rowValueNotNull && rowValue is num;
  final bool queryValueIsNumber = queryValueNotNull && value is num;

  final bool rowValueIsString = rowValueNotNull && rowValue is String || rowValueIsNumber;
  final bool queryValueIsString = queryValueNotNull && value is String || queryValueIsNumber;
  final String rowValueString = '$rowValue';
  final String queryValueString = '$value';

  final DateTime? rowValueDateTime = rowValueIsString && rowValueIsNumber == false ? DateTime.tryParse(rowValue.toString()) : null;
  final DateTime? queryValueDateTime = queryValueIsString && queryValueIsNumber == false ? DateTime.tryParse(value.toString()) : null;
  final bool rowValueIsDate = rowValueDateTime != null;
  final bool queryValueIsDate = queryValueDateTime != null;

  if (type == QueryFieldType.equals) {
    return rowValueNotNull && rowValue == value;
  } else if (type == QueryFieldType.notEquals) {
    return rowValueNotNull && rowValue != value;
  } else if (type == QueryFieldType.startsWith) {
    return rowValueIsString && queryValueIsString && rowValueString.startsWith(queryValueString);
  } else if (type == QueryFieldType.notStartsWith) {
    return rowValueIsString && queryValueIsString && rowValueString.startsWith(queryValueString) == false;
  } else if (type == QueryFieldType.endsWith) {
    return rowValueIsString && queryValueIsString && rowValueString.endsWith(queryValueString);
  } else if (type == QueryFieldType.notEndsWith) {
    return rowValueIsString && queryValueIsString && rowValueString.endsWith(queryValueString) == false;
  } else if (type == QueryFieldType.contains) {
    return rowValueIsString && queryValueIsString && rowValueString.contains(queryValueString);
  } else if (type == QueryFieldType.notContains) {
    return rowValueIsString && queryValueIsString && rowValueString.contains(queryValueString) == false;
  } else if (type == QueryFieldType.empty) {
    return rowValueIsString && rowValueString.isEmpty;
  } else if (type == QueryFieldType.notEmpty) {
    return rowValueIsString && rowValueString.isNotEmpty;
  } else if (type == QueryFieldType.less) {
    if (rowValueIsNumber && queryValueIsNumber) {
      return rowValue < value;
    } else if (rowValueIsDate && queryValueIsDate) {
      return rowValueDateTime.isBefore(queryValueDateTime);
    }
    return false;
  } else if (type == QueryFieldType.lessOrEquals) {
    if (rowValueIsNumber && queryValueIsNumber) {
      return rowValue <= value;
    } else if (rowValueIsDate && queryValueIsDate) {
      return rowValueDateTime.isBefore(queryValueDateTime) || rowValueDateTime.isAtSameMomentAs(queryValueDateTime);
    }
    return false;
  } else if (type == QueryFieldType.greater) {
    if (rowValueIsNumber && queryValueIsNumber) {
      return rowValue > value;
    } else if (rowValueIsDate && queryValueIsDate) {
      return queryValueDateTime.isBefore(rowValueDateTime);
    }
    return false;
  } else if (type == QueryFieldType.greaterOrEquals) {
    if (rowValueIsNumber && queryValueIsNumber) {
      return rowValue >= value;
    } else if (rowValueIsDate && queryValueIsDate) {
      return queryValueDateTime.isBefore(rowValueDateTime) || queryValueDateTime.isAtSameMomentAs(rowValueDateTime);
    }
    return false;
  } else if (type == QueryFieldType.isTrue) {
    return rowValue == true;
  } else if (type == QueryFieldType.isFalse) {
    return rowValue == false;
  } else if (type == QueryFieldType.isNull) {
    return rowValue == null;
  } else if (type == QueryFieldType.isNotNull) {
    return rowValue != null;
  }

  return false;
}
