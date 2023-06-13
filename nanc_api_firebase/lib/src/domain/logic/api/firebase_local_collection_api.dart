import 'dart:async';
import 'dart:math';

import 'package:googleapis/firestore/v1.dart' as fs;
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../mapper/firestore_value_mapper.dart';
import 'firebase_api.dart';
import 'firebase_collection_api_interface.dart';

class FirebaseLocalCollectionApi implements IFirebaseCollectionApi {
  FirebaseLocalCollectionApi({
    required FirebaseApi api,
    this.cacheTTL = const Duration(minutes: 2),
  }) : _api = api {
    _api.changesStream.listen(_clearOnChanges);
  }

  final Duration cacheTTL;
  final FirebaseApi _api;
  final Map<String, fs.RunQueryResponse> _cache = {};
  final Map<String, DateTime> _cacheTimestamp = {};

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params) async {
    final List<Json> result = [];
    late final fs.RunQueryResponse collection;
    final int now = DateTime.now().millisecondsSinceEpoch;
    if (_cache.containsKey(model.id) && _cacheTimestamp.containsKey(model.id) && _cacheTimestamp[model.id]!.millisecondsSinceEpoch > now) {
      collection = _cache[model.id]!;
    } else {
      _cache.remove(model.id);
      _cacheTimestamp.remove(model.id);
      collection = await _api.runQueryRequest(
        fs.RunQueryRequest(
          structuredQuery: fs.StructuredQuery(
            from: [
              fs.CollectionSelector(collectionId: model.id, allDescendants: false),
            ],
          ),
        ),
      );
      _cache[model.id] = collection;
      _cacheTimestamp[model.id] = DateTime.now().add(cacheTTL);
    }

    int i = 0;

    for (final fs.RunQueryResponseElement(:document) in collection) {
      i++;
      if (i % 100 == 0) {
        await Future<void>.delayed(Duration.zero);
      }
      if (document != null) {
        final Json json = documentToJson(model, document);
        if (_filterRow(json, query)) {
          result.add(json);
        }
      }
    }
    final List<Json> sortedResult = _sort(result, params.sort);

    int page = params.page;
    if (page > (sortedResult.length / params.limit).round()) {
      page = (sortedResult.length / params.limit).round();
    } else if (page < 1) {
      page = 1;
    }
    final List<Json> chunk =
        params.limit <= sortedResult.length ? sortedResult.sublist((page - 1) * params.limit, min((page * params.limit), sortedResult.length)) : sortedResult;
    final int totalPages = (sortedResult.length / params.limit).round();
    return CollectionResponseDto(
      page: page,
      totalPages: totalPages,
      data: chunk,
    );
  }

  void _clearOnChanges(Model model) {
    _cache.remove(model.id);
    _cacheTimestamp.remove(model.id);
  }
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
      final bool isOk = _filterRow(row, childQuery);
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

List<Json> _sort(List<Json> data, Sort sort) {
  data.sort((Json a, Json b) {
    final Object? firstField = sort.order.isAsc ? a[sort.fieldId] : b[sort.fieldId];
    final Object? secondField = sort.order.isAsc ? b[sort.fieldId] : a[sort.fieldId];
    if (firstField is String && secondField is String) {
      return firstField.compareTo(secondField);
    } else if (firstField is num && secondField is num) {
      return firstField.compareTo(secondField);
    }
    return 0;
  });
  return data;
}
