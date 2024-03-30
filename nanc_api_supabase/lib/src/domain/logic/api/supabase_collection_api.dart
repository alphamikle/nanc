import 'dart:math';

import 'package:nanc/model.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'supabase_api.dart';

const String _dl = '.';

class SupabaseCollectionApi implements ICollectionApi {
  SupabaseCollectionApi({
    required SupabaseApi api,
    this.caseSensitive = false,
  }) : _api = api;

  final SupabaseApi _api;
  final bool caseSensitive;

  @override
  Set<QueryFieldType> get supportedFilters => QueryFieldType.values.toSet();

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params) async {
    final int from = params.limit * (params.page - 1);
    final int to = params.limit * params.page - 1;
    final Sort sort = params.sort;
    final QueryField effectiveQuery = query is QueryValueField ? QueryOrField(fields: [query]) : query;

    final PostgrestFilterBuilder<dynamic> selection = _api.getSelection(model: model, subset: subset);
    final String filter = _processQueryField(effectiveQuery);
    if (filter.isNotEmpty) {
      selection.appendSearchParams(_processFieldType(effectiveQuery.type, null, showValue: false), filter);
    }
    final PostgrestResponse<dynamic> response = await selection.range(from, to).order(sort.fieldId, ascending: sort.order.isAsc) as PostgrestResponse<dynamic>;
    final int count = response.count ?? 0;
    final int totalPages = params.limit > 0 ? (count / params.limit).ceil() : 0;
    final int page = max(min(params.page, totalPages), 0);
    final List<Json> data = response.data is List<dynamic> ? (response.data as List<dynamic>).map(castToJson).toList() : [];

    return CollectionResponseDto(
      page: page,
      totalPages: totalPages,
      data: data,
    );
  }

  String _processQueryField(QueryField query, {int deep = 0}) {
    return switch (query) {
      QueryConditionField(isEmpty: final bool isEmpty) when isEmpty => '',
      QueryOrField() => _processOrField(query, deep: deep),
      QueryAndField() => _processAndField(query, deep: deep),
      QueryValueField() => _processValueField(query, deep: deep),
    };
  }

  String _processOrField(QueryOrField query, {int deep = 0}) {
    return '${deep == 0 ? '' : 'or'}(${query.fields.map((QueryField field) => _processQueryField(field, deep: deep + 1)).join(',')})';
  }

  String _processAndField(QueryAndField query, {int deep = 0}) {
    return '${deep == 0 ? '' : 'and'}(${query.fields.map((QueryField field) => _processQueryField(field, deep: deep + 1)).join(',')})';
  }

  String _processValueField(QueryValueField query, {int deep = 0}) {
    final Object? value = query.value;
    final QueryFieldType type = query.type;
    final String fieldId = query.fieldId;

    final String condition = _processFieldType(type, value);
    return '$fieldId$_dl$condition';
  }

  String _processFieldType(QueryFieldType type, Object? value, {bool showValue = true}) {
    const String any = '%';

    final String condition = switch (type) {
      QueryFieldType.equals => 'eq${showValue ? '$_dl$value' : ''}',
      QueryFieldType.notEquals => 'neq${showValue ? '$_dl$value' : ''}',
      QueryFieldType.startsWith => '${caseSensitive ? '' : 'i'}like${showValue ? '$_dl$value$any' : ''}',
      QueryFieldType.notStartsWith => 'not.${caseSensitive ? '' : 'i'}like${showValue ? '$_dl$value$any' : ''}',
      QueryFieldType.endsWith => '${caseSensitive ? '' : 'i'}like${showValue ? '$_dl$any$value' : ''}',
      QueryFieldType.notEndsWith => 'not.${caseSensitive ? '' : 'i'}like${showValue ? '$_dl$any$value' : ''}',
      QueryFieldType.contains => '${caseSensitive ? '' : 'i'}like${showValue ? '$_dl$any$value$any' : ''}',
      QueryFieldType.notContains => '${caseSensitive ? '' : 'i'}like${showValue ? '$_dl$any$value$any' : ''}',
      QueryFieldType.empty => 'eq${showValue ? '$_dl\'\'' : ''}',
      QueryFieldType.notEmpty => 'neq${showValue ? '$_dl\'\'' : ''}',
      QueryFieldType.less => 'lt${showValue ? '$_dl$value' : ''}',
      QueryFieldType.lessOrEquals => 'lte${showValue ? '$_dl$value' : ''}',
      QueryFieldType.greater => 'gt${showValue ? '$_dl$value' : ''}',
      QueryFieldType.greaterOrEquals => 'gte${showValue ? '$_dl$value' : ''}',
      QueryFieldType.isTrue => 'eq${showValue ? '${_dl}true' : ''}',
      QueryFieldType.isFalse => 'eq${showValue ? '${_dl}false' : ''}',
      QueryFieldType.isNull => 'eq${showValue ? '${_dl}null' : ''}',
      QueryFieldType.isNotNull => 'neq${showValue ? '${_dl}null' : ''}',
      QueryFieldType.unknown => 'unknown',
      QueryFieldType.or => 'or',
      QueryFieldType.and => 'and',
    };
    return condition;
  }
}
