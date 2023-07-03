import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../../cms.dart';
import 'collection_state.dart';

class CollectionBloc extends Cubit<CollectionState> {
  CollectionBloc({
    required this.modelCollectionBloc,
    required this.pageListProvider,
    required this.eventBus,
  }) : super(CollectionState.empty()) {
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: PageEvents.save, handler: _reloadCollection);
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: CollectionFilterEvents.filterChanges, handler: _loadFilteredPages);
    _initTableSearchListener();
  }

  final ICollectionProvider pageListProvider;
  final ModelListBloc modelCollectionBloc;
  final EventBus eventBus;
  final TextEditingController globalSearchController = TextEditingController();

  void clear() => emit(CollectionState.empty());

  Future<void> loadCollection(String modelId) async {
    if (state.modelId == modelId) {
      return;
    }
    eventBus.send(eventId: CollectionFilterEvents.collectionLoad, request: modelId);
    final bool isTheSameCollection = state.modelId == modelId;
    if (isTheSameCollection) {
      emit(state.copyWith(
        isLoading: true,
        notFoundAnything: false,
        dataRows: [],
      ));
    } else {
      globalSearchController.clear();
      emit(state.copyWith(
        isLoading: true,
        notFoundAnything: false,
        modelId: modelId,
        totalPages: 1,
        currentPage: 1,
        dataRows: [],
      ));
      emit(state.copyWithNull(
        query: true,
        globalSearchQuery: true,
        sort: true,
      ));
    }
    await _loadData(modelId: modelId, page: state.currentPage);
  }

  Future<void> paginate(int page) async {
    emit(state.copyWith(
      isLoading: true,
      currentPage: page,
    ));
    await _loadData(modelId: state.modelId, page: page);
  }

  Future<void> sort(Field field, Order order) async {
    final Sort sort = Sort(fieldId: field.id, order: order);
    emit(state.copyWith(
      isLoading: true,
      sort: sort == state.sort ? null : sort,
    ));
    await _loadData(modelId: state.modelId);
  }

  Future<void> _reloadCollection(Model model) async => _loadData(modelId: model.id, page: state.currentPage);

  Future<void> _filterTableByGlobalSearch() async {
    if (state.modelId.isEmpty) {
      return;
    }
    final QueryField? globalSearchQuery = _mapSearchQueryToLanguageQuery(
      globalSearchController.text,
      modelCollectionBloc.findModelById(state.modelId).flattenFields,
    );
    if (globalSearchQuery != state.globalSearchQuery) {
      emit(state.copyWith(isLoading: true));
      Debouncer.run(
        id: '_filterTableByGlobalSearch',
        () async {
          emit(state.copyWith(globalSearchQuery: globalSearchQuery));
          await _loadData(modelId: state.modelId);
        },
      );
    }
  }

  void _initTableSearchListener() => globalSearchController.addListener(_filterTableByGlobalSearch);

  Future<void> _loadData({
    required String modelId,
    int page = 1,
    int? limit,
  }) async {
    final Model model = modelCollectionBloc.findModelById(modelId);
    emit(state.copyWith(isError: false));

    try {
      final CollectionResponseDto dto = await pageListProvider.fetchPageList(
        model: model,
        subset: model.listFields.ids,
        params: ParamsDto(
          page: page,
          limit: limit ?? NetworkConfig.paginationLimitParameterDefaultValue,
          sort: state.sort ??
              Sort(
                fieldId: model.idField.id,
                order: Order.asc,
              ),
        ),
        query: state.query ?? state.globalSearchQuery,
      );
      emit(state.copyWith.isLoading(false));
      await _uiDelay();
      emit(state.copyWith(
        dataRows: dto.data,
        totalPages: dto.totalPages,
        currentPage: dto.page,
        notFoundAnything: dto.data.isEmpty,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        notFoundAnything: false,
      ));
      throw [error, stackTrace].toHumanException('Collection "${model.name}" loading failed!');
    }
  }

  Future<void> _loadFilteredPages(QueryField? query) async {
    emit(state.copyWith(
      isLoading: true,
      query: query,
    ));
    await _loadData(modelId: state.modelId);
  }

  QueryField? _mapSearchQueryToLanguageQuery(String query, List<Field> fields) {
    if (query.isEmpty || fields.isEmpty) {
      return null;
    }
    if (fields.length == 1) {
      return QueryValueField(value: query, type: QueryFieldType.contains, fieldId: fields.first.id);
    }
    final List<QueryValueField> valueFields = [];
    final num? queryNumber = num.tryParse(query);
    final bool? queryBool = query == 'true'
        ? true
        : query == 'false'
            ? false
            : null;
    for (final Field field in fields) {
      if (queryBool != null && field.isBool) {
        valueFields.add(QueryValueField(type: queryBool ? QueryFieldType.isTrue : QueryFieldType.isFalse, fieldId: field.id));
      } else if (queryNumber != null && field.isNumeric) {
        valueFields.add(QueryValueField(type: QueryFieldType.equals, fieldId: field.id, value: queryNumber));
      } else if (field is IdField || field is SelectorField) {
        // TODO(alphamikle): Add errors handling
        // TODO(alphamikle): Add search by UUID and int ids (when int ids will be available)
        /// ? Do nothing
        // valueFields.add(QueryValueField(type: QueryFieldType.equals, fieldId: field.id, value: query));
      } else if (field.isString) {
        valueFields.add(QueryValueField(type: QueryFieldType.contains, fieldId: field.id, value: query));
      }
    }
    return QueryOrField(fields: valueFields);
  }
}

Future<void> _uiDelay([Duration delay = const Duration(milliseconds: 100)]) async => wait(duration: delay);
