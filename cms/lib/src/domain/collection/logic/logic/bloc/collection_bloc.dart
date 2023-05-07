import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../../../../../../cms.dart';
import 'collection_state.dart';

class CollectionBloc extends Cubit<CollectionState> {
  CollectionBloc({
    required this.modelCollectionBloc,
    required this.pageListProvider,
    required this.eventBus,
  }) : super(CollectionState.empty()) {
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: PageEvents.save, handler: _reloadEntitiesAfterSave);
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: CollectionFilterEvents.filterChanges, handler: _loadFilteredPages);
    _initTableSearchListener();
  }

  final ICollectionProvider pageListProvider;
  final ModelListBloc modelCollectionBloc;
  final EventBus eventBus;
  final TextEditingController globalSearchController = TextEditingController();

  Future<void> loadPages(String modelId) async {
    eventBus.send(eventId: CollectionFilterEvents.collectionLoad, request: modelId);
    if (state.modelId != modelId) {
      globalSearchController.clear();
    }
    emit(state.copyWith(
      isLoading: true,
      notFoundAnything: false,
      modelId: modelId,
      dataRows: [],
      totalPages: 0,
      currentPage: 0,
    ));
    final CollectionResponseDto dto = await _loadData(modelId: modelId);
    emit(state.copyWith.isLoading(false));
    await _uiDelay();
    emit(state.copyWith(
      dataRows: dto.data,
      totalPages: dto.totalPages,
      currentPage: dto.page,
      notFoundAnything: dto.data.isEmpty,
    ));
  }

  Future<void> _reloadEntitiesAfterSave(Model model) async => loadPages(model.id);

  Future<void> _filterTableByGlobalSearch() async {
    emit(state.copyWith(isLoading: true));
    await Debouncer.run(id: '_filterTableByGlobalSearch', () async {
      final CollectionResponseDto dto = await _loadData(modelId: state.modelId);
      final List<Json> data = dto.data;
      emit(state.copyWith(isLoading: false));
      await _uiDelay();
      emit(state.copyWith(
        dataRows: data,
        notFoundAnything: data.isEmpty,
        currentPage: dto.page,
        totalPages: dto.totalPages,
      ));
    });
  }

  void _initTableSearchListener() {
    globalSearchController.addListener(_filterTableByGlobalSearch);
  }

  Future<CollectionResponseDto> _loadData({
    required String modelId,
    int page = 1,
    int? limit,
  }) async {
    final Model? model = modelCollectionBloc.findModelById(modelId);
    if (model == null) {
      throw notFoundModelError(modelId);
    }
    final String query = globalSearchController.text;

    final CollectionResponseDto dto = await pageListProvider.fetchPageList(
      model: model,
      subset: model.listFields.ids,
      params: ParamsDto(
        page: page,
        limit: limit ?? NetworkConfig.paginationLimitParameterDefaultValue,
        sort: Sort(
          field: model.idField.id,
          order: Order.asc,
        ),
      ),
      query: query.isEmpty
          ? const QueryDto()
          : QueryDto(
              singleValues: model.listFields.ids
                  .map((String fieldId) => QuerySingleParameter(
                        name: fieldId,
                        value: QueryStringValue(query),
                      ))
                  .toList(),
            ),
    );
    return dto;
  }

  Future<void> _loadFilteredPages(CollectionFilterState filterState) async {
    logg.rows('Filter event: $filterState');
  }

  Future<void> paginate(int page) async {
    emit(state.copyWith(
      isLoading: true,
      currentPage: page,
    ));
    final CollectionResponseDto dto = await _loadData(
      modelId: state.modelId,
      page: page,
    );
    emit(state.copyWith(isLoading: false));
    await _uiDelay();
    emit(state.copyWith(
      dataRows: dto.data,
      currentPage: dto.page,
      totalPages: dto.totalPages,
      notFoundAnything: dto.data.isEmpty,
    ));
  }

  /// FILTER LIST (SEARCH, SORT, ETC)
}

Future<void> _uiDelay() async => wait(duration: const Duration(milliseconds: 100));
