import 'package:config/config.dart';
import 'package:googleapis/firestore/v1.dart' as fs;
import 'package:nanc_model/nanc_model.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:tools/tools.dart';

import '../mapper/firestore_value_mapper.dart';
import 'firebase_api.dart';
import 'firebase_collection_api_interface.dart';

class FirebaseCollectionApi implements IFirebaseCollectionApi {
  FirebaseCollectionApi({
    required FirebaseApi api,
    this.cacheTTL = Duration.zero,
  }) : _api = api;

  final Duration cacheTTL;
  final FirebaseApi _api;
  final Map<String, CollectionResponseDto> _cache = {};
  final Map<String, DateTime> _cacheTimestamp = {};

  final Map<String, int> _documentsCount = {};

  @override
  Set<QueryFieldType> get supportedFilters => {
        QueryFieldType.equals,
        QueryFieldType.notEquals,
        QueryFieldType.empty,
        QueryFieldType.notEmpty,
        QueryFieldType.less,
        QueryFieldType.lessOrEquals,
        QueryFieldType.greater,
        QueryFieldType.greaterOrEquals,
        QueryFieldType.isTrue,
        QueryFieldType.isFalse,
        QueryFieldType.isNull,
        QueryFieldType.isNotNull,
      };

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params) async {
    final String requestKey = '${model.toString()}:${subset.toString()}:${query.toString()}:${params.toString()}';
    if (cacheTTL != Duration.zero) {
      final DateTime? timestamp = _cacheTimestamp[requestKey];
      await _checkCache();
      if (timestamp != null && timestamp.add(cacheTTL).isBefore(DateTime.now()) && _cache[requestKey] is CollectionResponseDto) {
        return _cache[requestKey]!;
      }
    }

    final fs.RunQueryRequest queryRequest = fs.RunQueryRequest();
    final fs.StructuredQuery structuredQuery = fs.StructuredQuery();
    structuredQuery.from = [
      fs.CollectionSelector(allDescendants: false, collectionId: model.id),
    ];
    structuredQuery.where = query.isConditionalAndEmpty ? null : _processQueryField(fs.Filter(), query);
    final bool isDefaultIdSort = params.sort.fieldId == model.idField.id && params.sort.order.isAsc;
    structuredQuery.orderBy = isDefaultIdSort
        ? null
        : [
            fs.Order(
              direction: params.sort.order.isAsc ? 'ASCENDING' : 'DESCENDING',
              field: fs.FieldReference(fieldPath: params.sort.fieldId),
            ),
          ];
    structuredQuery.limit = params.limit;
    structuredQuery.offset = params.limit * (params.page - 1);
    structuredQuery.select = fs.Projection(fields: subset.map((String fieldId) => fs.FieldReference(fieldPath: fieldId)).toList());
    queryRequest.structuredQuery = structuredQuery;
    final fs.RunQueryResponse result = await _api.runQueryRequest(queryRequest);
    final Iterable<fs.Document> documents = result.map((fs.RunQueryResponseElement element) => element.document).whereNotNull();
    final List<Json> data = documents.map((fs.Document document) => documentToJson(model, document)).toList();
    final int cachedTotalPages = _documentsCount[model.id] ?? 1;
    int currentPage = params.page;
    int totalPages = currentPage + 1;
    if (cachedTotalPages > totalPages) {
      totalPages = cachedTotalPages;
    }

    if (data.isEmpty && currentPage > 1) {
      currentPage--;
      totalPages = currentPage + 1;
    }
    _documentsCount[model.id] = totalPages;

    if (data.isEmpty && params.page > 1) {
      return fetchPageList(model, subset, query, params.copyWith(page: currentPage));
    }

    final CollectionResponseDto response = CollectionResponseDto(
      page: currentPage,
      totalPages: totalPages,
      data: data,
    );
    if (cacheTTL != Duration.zero) {
      _cache[requestKey] = response;
      _cacheTimestamp[requestKey] = DateTime.now();
    }
    return response;
  }

  fs.Filter _processQueryField(fs.Filter filter, QueryField query) {
    return switch (query) {
      QueryConditionField(isEmpty: final bool isEmpty) when isEmpty => filter,
      QueryOrField() => _processOrField(filter, query),
      QueryAndField() => _processAndField(filter, query),
      QueryValueField() => _processValueField(filter, query),
    };
  }

  fs.Filter _processOrField(fs.Filter filter, QueryOrField query) {
    final fs.CompositeFilter compositeFilter = fs.CompositeFilter();
    compositeFilter.op = 'OR';
    compositeFilter.filters = query.fields.map((QueryField query) => _processQueryField(fs.Filter(), query)).toList();
    filter.compositeFilter = compositeFilter;
    return filter;
  }

  fs.Filter _processAndField(fs.Filter filter, QueryAndField query) {
    final fs.CompositeFilter compositeFilter = fs.CompositeFilter();
    compositeFilter.op = 'AND';
    compositeFilter.filters = query.fields.map((QueryField query) => _processQueryField(fs.Filter(), query)).toList();
    filter.compositeFilter = compositeFilter;
    return filter;
  }

  fs.Filter _processValueField(fs.Filter filter, QueryValueField query) {
    if (query.type.isCommonType) {
      final fs.UnaryFilter fieldFilter = fs.UnaryFilter();
      fieldFilter.field = fs.FieldReference(fieldPath: query.fieldId);
      fieldFilter.op = _processFieldType(query.type, query.value);
      filter.unaryFilter = fieldFilter;
      return filter;
    }
    final fs.FieldFilter fieldFilter = fs.FieldFilter();
    fieldFilter.field = fs.FieldReference(fieldPath: query.fieldId);
    fieldFilter.op = _processFieldType(query.type, query.value);
    fieldFilter.value = _processFieldValue(query.type, query.value);
    filter.fieldFilter = fieldFilter;
    return filter;
  }

  String _processFieldType(QueryFieldType type, dynamic value) {
    return switch (type) {
      QueryFieldType.or => 'OPERATOR_UNSPECIFIED',
      QueryFieldType.and => 'OPERATOR_UNSPECIFIED',
      QueryFieldType.equals => 'EQUAL',
      QueryFieldType.notEquals => 'NOT_EQUAL',
      QueryFieldType.startsWith => 'OPERATOR_UNSPECIFIED',
      QueryFieldType.notStartsWith => 'OPERATOR_UNSPECIFIED',
      QueryFieldType.endsWith => 'OPERATOR_UNSPECIFIED',
      QueryFieldType.notEndsWith => 'OPERATOR_UNSPECIFIED',

      /// ? Used for global search as EQUALS
      QueryFieldType.contains => 'EQUAL',
      QueryFieldType.notContains => 'OPERATOR_UNSPECIFIED',
      QueryFieldType.empty => 'EQUAL',
      QueryFieldType.notEmpty => 'NOT_EQUAL',
      QueryFieldType.less => 'LESS_THAN',
      QueryFieldType.lessOrEquals => 'LESS_THAN_OR_EQUAL',
      QueryFieldType.greater => 'GREATER_THAN',
      QueryFieldType.greaterOrEquals => 'GREATER_THAN_OR_EQUAL',
      QueryFieldType.isTrue => 'EQUAL',
      QueryFieldType.isFalse => 'EQUAL',
      QueryFieldType.isNull => 'IS_NULL',
      QueryFieldType.isNotNull => 'IS_NOT_NULL',
      QueryFieldType.unknown => 'OPERATOR_UNSPECIFIED',
    };
  }

  fs.Value? _processFieldValue(QueryFieldType type, dynamic value) {
    final bool returnNull = switch (type) {
      QueryFieldType.or => true,
      QueryFieldType.and => true,
      QueryFieldType.equals => false,
      QueryFieldType.notEquals => false,
      QueryFieldType.startsWith => true,
      QueryFieldType.notStartsWith => true,
      QueryFieldType.endsWith => true,
      QueryFieldType.notEndsWith => true,

      /// ? Used for global search as EQUALS
      QueryFieldType.contains => false,
      QueryFieldType.notContains => true,
      QueryFieldType.empty => false,
      QueryFieldType.notEmpty => false,
      QueryFieldType.less => false,
      QueryFieldType.lessOrEquals => false,
      QueryFieldType.greater => false,
      QueryFieldType.greaterOrEquals => false,
      QueryFieldType.isTrue => false,
      QueryFieldType.isFalse => false,
      QueryFieldType.isNull => false,
      QueryFieldType.isNotNull => false,
      QueryFieldType.unknown => true,
    };
    if (returnNull) {
      return null;
    }
    return toFirestoreValue(value);
  }

  Future<void> _checkCache() async {
    final List<String> exceededCacheKeys = [];
    const int syncChunkSize = 100;
    int i = 0;
    for (final MapEntry(:key, :value) in _cacheTimestamp.entries) {
      i++;
      if (i % syncChunkSize == 0) {
        await wait();
      }
      if (value.add(cacheTTL).isAfter(DateTime.now())) {
        exceededCacheKeys.add(key);
      }
    }

    for (final String key in exceededCacheKeys) {
      i++;
      if (i % syncChunkSize == 0) {
        await wait();
      }
      _cache.remove(key);
      _cacheTimestamp.remove(key);
    }
  }
}
