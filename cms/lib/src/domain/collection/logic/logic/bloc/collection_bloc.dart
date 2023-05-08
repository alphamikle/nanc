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
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: PageEvents.save, handler: _reloadCollection);
    eventBus.onEvent(consumer: 'CollectionBloc', eventId: CollectionFilterEvents.filterChanges, handler: _loadFilteredPages);
    _initTableSearchListener();
  }

  final ICollectionProvider pageListProvider;
  final ModelListBloc modelCollectionBloc;
  final EventBus eventBus;
  final TextEditingController globalSearchController = TextEditingController();

  Future<void> loadCollection(String modelId) async {
    eventBus.send(eventId: CollectionFilterEvents.collectionLoad, request: modelId);
    final bool isTheSameCollection = state.modelId == modelId;
    if (isTheSameCollection == false) {
      globalSearchController.clear();
      emit(state.copyWith(query: null));
    }
    emit(state.copyWith(
      isLoading: true,
      notFoundAnything: false,
      modelId: modelId,
      dataRows: [],
      totalPages: 1,
      currentPage: 1,
    ));
    await _loadData(modelId: modelId);
  }

  Future<void> _reloadCollection(Model model) async => _loadData(modelId: model.id, page: state.currentPage);

  // TODO(alphamikle): Use class CollectionFilterBloc and do filter through it
  Future<void> _filterTableByGlobalSearch() async {
    // emit(state.copyWith(isLoading: true));
    // await Debouncer.run(id: '_filterTableByGlobalSearch', () async => _loadData(modelId: state.modelId));
  }

  void _initTableSearchListener() => globalSearchController.addListener(_filterTableByGlobalSearch);

  Future<void> _loadData({
    required String modelId,
    int page = 1,
    int? limit,
  }) async {
    final Model? model = modelCollectionBloc.findModelById(modelId);
    if (model == null) {
      throw notFoundModelError(modelId);
    }

    final CollectionResponseDto dto = await pageListProvider.fetchPageList(
      model: model,
      subset: model.listFields.ids,
      params: ParamsDto(
        page: page,
        limit: limit ?? NetworkConfig.paginationLimitParameterDefaultValue,
        // TODO(alphamikle): Add sorting via UI
        sort: Sort(
          field: model.idField.id,
          order: Order.asc,
        ),
      ),
      query: state.query,
    );
    emit(state.copyWith.isLoading(false));
    await _uiDelay();
    emit(state.copyWith(
      dataRows: dto.data,
      totalPages: dto.totalPages,
      currentPage: dto.page,
      notFoundAnything: dto.data.isEmpty,
    ));
  }

  Future<void> _loadFilteredPages(QueryField query) async {
    emit(state.copyWith(
      isLoading: true,
      query: query,
    ));
    await _loadData(modelId: state.modelId);
  }

  Future<void> paginate(int page) async {
    emit(state.copyWith(
      isLoading: true,
      currentPage: page,
    ));
    await _loadData(modelId: state.modelId, page: page);
  }
}

Future<void> _uiDelay() async => wait(duration: const Duration(milliseconds: 100));
