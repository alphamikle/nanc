import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../../service/errors/human_exception.dart';
import '../../../../document/logic/bloc/document_bloc/document_bloc.dart';
import '../../../../field/logic/bloc/local_page_bloc/local_page_bloc.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'collection_state.dart';
import 'model_filters_backup.dart';

class CollectionBloc extends Cubit<CollectionState> {
  CollectionBloc({
    required this.modelCollectionBloc,
    required this.pageListProvider,
    required this.filterStructureBloc,
    required this.eventBus,
  }) : super(CollectionState.empty()) {
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: DocumentEvent.documentChanged, handler: _reloadCollection);
    globalSearchController.addListener(_filterTableByGlobalSearch);
  }

  final ICollectionProvider pageListProvider;
  final ModelListBloc modelCollectionBloc;
  final LocalPageBloc filterStructureBloc;
  final EventBus eventBus;
  final TextEditingController globalSearchController = TextEditingController();
  bool globalSearchSilenced = false;

  /// ? This method will be called when we first open a collection through the interface, or switch to a new collection from some other collection
  Future<void> loadCollection(String modelId) async {
    if (state.model.id == modelId) {
      return;
    }
    globalSearchSilenced = true;
    final Model? model = modelCollectionBloc.tryToFindModelById(modelId);
    if (model == null) {
      globalSearchSilenced = false;
      notFoundModelError(modelId);
    }
    final bool isTheSameCollection = state.model.id == modelId;
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
        model: model,
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
    await restoreFiltersBackup();
    await _loadData(modelId: modelId, page: state.currentPage);
    globalSearchSilenced = false;
  }

  Future<void> paginate(int page) async {
    emit(state.copyWith(
      isLoading: true,
      currentPage: page,
    ));
    await makeFiltersBackup();
    await _loadData(modelId: state.model.id, page: page);
  }

  Future<void> sort(Field field, Order order) async {
    final Sort sort = Sort(fieldId: field.id, order: order);
    emit(state.copyWith(
      isLoading: true,
      sort: sort == state.sort ? null : sort,
    ));
    await makeFiltersBackup();
    await _loadData(modelId: state.model.id);
  }

  Future<void> makeFiltersBackup() async {
    final ModelFiltersBackup modelFiltersBackup = ModelFiltersBackup(
      model: state.model,
      totalPages: state.totalPages,
      currentPage: state.currentPage,
      query: state.query,
      globalSearchQuery: state.globalSearchQuery,
      sort: state.sort,
      globalSearchValue: globalSearchController.text,
    );
    emit(state.copyWith(
      filtersBackup: {
        ...state.filtersBackup,
        state.model.id: modelFiltersBackup,
      },
    ));
  }

  Future<void> restoreFiltersBackup() async {
    if (state.filtersBackup.containsKey(state.model.id)) {
      final ModelFiltersBackup modelFiltersBackup = state.modelFiltersBackup;
      emit(state.copyWith(
        query: modelFiltersBackup.query,
        sort: modelFiltersBackup.sort,
        currentPage: modelFiltersBackup.currentPage,
        totalPages: modelFiltersBackup.totalPages,
        globalSearchQuery: modelFiltersBackup.globalSearchQuery,
      ));
      emit(state.copyWithNull(
        sort: modelFiltersBackup.sort == null,
        globalSearchQuery: modelFiltersBackup.globalSearchQuery == null,
        query: modelFiltersBackup.query == null,
      ));
      filterStructureBloc.init(state.query);
      globalSearchSilenced = true;
      globalSearchController.text = modelFiltersBackup.globalSearchValue;
      unawaited(Future<void>.delayed(const Duration(milliseconds: 250)).then((value) => globalSearchSilenced = false));
    } else {
      filterStructureBloc.init(null);
    }
  }

  Future<void> applyFilters() async {
    final QueryField? queryField = queryFieldFromJson(mapQueryFieldCellJsonToQueryFieldJson(filterStructureBloc.state.data));
    if (queryField == state.query) {
      return;
    }
    if (queryField == null) {
      emit(state.copyWithNull(query: true));
    } else {
      emit(state.copyWith(query: queryField));
    }
    await makeFiltersBackup();
    emit(state.copyWith(isLoading: true));
    await _loadData(modelId: state.model.id);
  }

  Future<void> wipeQueryFilters() async {
    if (state.filtersBackup.containsKey(state.model.id)) {
      final ModelFiltersBackup modelFiltersBackup = state.modelFiltersBackup;
      emit(state.copyWith(
        filtersBackup: {
          ...state.filtersBackup,
          state.model.id: modelFiltersBackup.copyWithNull(query: true),
        },
      ));
      emit(state.copyWithNull(query: true));
      filterStructureBloc.init(null);
      unawaited(applyFilters());
    }
  }

  Future<void> _reloadCollection(Model model) async => _loadData(modelId: model.id, page: max(state.currentPage, 1));

  Future<void> _filterTableByGlobalSearch() async {
    if (state.model.id.isEmpty || globalSearchSilenced || (state.globalSearchQuery == null && globalSearchController.text.isEmpty)) {
      return;
    }
    final QueryField? globalSearchQuery = _mapSearchQueryToLanguageQuery(globalSearchController.text, state.model.flattenFields);
    if (globalSearchQuery != state.globalSearchQuery) {
      emit(state.copyWith(isLoading: true));
      Debouncer.run(
        id: '_filterTableByGlobalSearch',
        () async {
          if (globalSearchQuery != null) {
            emit(state.copyWith(globalSearchQuery: globalSearchQuery));
          } else {
            emit(state.copyWithNull(globalSearchQuery: true));
          }
          await makeFiltersBackup();
          await _loadData(modelId: state.model.id);
        },
      );
    }
  }

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
