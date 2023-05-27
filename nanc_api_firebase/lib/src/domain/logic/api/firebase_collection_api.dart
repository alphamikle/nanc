import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/model.dart';
import 'package:nanc_api_firebase/src/domain/logic/api/firebase_api.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

class FirebaseCollectionApi implements ICollectionApi {
  FirebaseCollectionApi({
    required FirebaseApi api,
  }) : _api = api;

  final FirebaseApi _api;

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params) async {
    final CollectionReference<Json> collection = _api.getCollection(model);
    Query<Json> fireQuery = collection;
    if (query is QueryAndField && query.isEmpty == false) {
      for (final QueryField queryField in query.fields) {
        if (queryField is QueryValueField) {
          fireQuery = _filterByQueryValueField(fireQuery, queryField);
        } else {
          throw Exception('Firestore do not support embedded logical conditions (like "or" inside "and")');
        }
      }
    } else if (query is QueryValueField) {
      fireQuery = _filterByQueryValueField(fireQuery, query);
    } else if (query is QueryOrField && query.isEmpty == false) {
      throw Exception('Firestore do not support logical "or" conditions');
    }
    fireQuery = fireQuery.orderBy(params.sort.fieldId, descending: params.sort.order.isDesc);
    final AggregateQuerySnapshot countResult = await fireQuery.count().get(source: AggregateSource.server);
    late final QuerySnapshot<Json> result;

    if (params.page > 1) {
      result = await _paginate(fireQuery, params.page, params.limit);
    } else {
      result = await fireQuery.limit(params.limit).get(const GetOptions(source: Source.server));
    }

    final List<Json> documents = result.docs.map((QueryDocumentSnapshot<Json> snapshot) => snapshot.data()).toList();
    final int totalPages = (countResult.count / params.limit).ceil();
    final int page = max(min(params.page, totalPages), 0);

    return CollectionResponseDto(
      page: page,
      totalPages: totalPages,
      data: documents,
    );
  }

  Query<Json> _filterByQueryValueField(Query<Json> fireQuery, QueryValueField filterQuery) {
    final String field = filterQuery.fieldId;
    final dynamic value = filterQuery.value;

    return switch (filterQuery.type) {
      QueryFieldType.and => throw Exception('Embedded logical conditions, such as "and" are not supported by Firestore'),
      QueryFieldType.or => throw Exception('Embedded logical conditions, such as "or" are not supported by Firestore'),
      QueryFieldType.equals => fireQuery.where(field, isEqualTo: value),
      QueryFieldType.notEquals => fireQuery.where(field, isNotEqualTo: value),
      QueryFieldType.startsWith => throw Exception('Firestore does not support "startsWith" condition'),
      QueryFieldType.notStartsWith => throw Exception('Firestore does not support "notStartsWith" condition'),
      QueryFieldType.endsWith => throw Exception('Firestore does not support "endsWith" condition'),
      QueryFieldType.notEndsWith => throw Exception('Firestore does not support "notEndsWith" condition'),
      // TODO(alphamikle): Add support of array-values filtering
      QueryFieldType.contains => fireQuery.where(field, whereIn: []),
      QueryFieldType.notContains => fireQuery.where(field, whereNotIn: []),
      QueryFieldType.empty => fireQuery.where(field, isEqualTo: ''),
      QueryFieldType.notEmpty => fireQuery.where(field, isNotEqualTo: ''),
      QueryFieldType.less => fireQuery.where(field, isLessThan: value),
      QueryFieldType.lessOrEquals => fireQuery.where(field, isLessThanOrEqualTo: value),
      QueryFieldType.greater => fireQuery.where(field, isGreaterThan: value),
      QueryFieldType.greaterOrEquals => fireQuery.where(field, isGreaterThanOrEqualTo: value),
      QueryFieldType.isTrue => fireQuery.where(field, isEqualTo: true),
      QueryFieldType.isFalse => fireQuery.where(field, isEqualTo: false),
      QueryFieldType.isNull => fireQuery.where(field, isNull: true),
      QueryFieldType.isNotNull => fireQuery.where(field, isNull: false),
      QueryFieldType.unknown => throw Exception('Unknown condition is not supported anywhere'),
    };
  }

  Future<QuerySnapshot<Json>> _paginate(Query<Json> fireQuery, int targetPage, int limit) async {
    assert(targetPage > 1, 'Firestore pagination will works only if page > 1');
    late QuerySnapshot<Json> result;
    Query<Json> intermediateQuery = fireQuery;
    late QuerySnapshot<Json> intermediateDocument;
    for (int i = 1; i <= targetPage; i++) {
      final bool isFirst = i == 1;
      final bool isLast = i == targetPage;

      if (isFirst) {
        final QuerySnapshot<Json> response = await intermediateQuery.limitToLast(limit).get(const GetOptions(source: Source.server));
        if (response.docs.isEmpty) {
          return response;
        }
        intermediateDocument = response;
      } else if (isLast) {
        if (intermediateDocument.docs.isEmpty) {
          return intermediateDocument;
        }
        result = await intermediateQuery.limit(limit).startAfterDocument(intermediateDocument.docs.last).get(const GetOptions(source: Source.server));
      } else {
        intermediateDocument =
            await intermediateQuery.limitToLast(limit).startAfterDocument(intermediateDocument.docs.last).get(const GetOptions(source: Source.server));
      }
    }
    return result;
  }
}
