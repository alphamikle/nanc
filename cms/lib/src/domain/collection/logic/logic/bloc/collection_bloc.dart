import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../../../page/logic/bloc/page_bloc/page_bloc.dart';
import 'collection_state.dart';

class CollectionBloc extends Cubit<CollectionState> {
  CollectionBloc({
    required this.modelListBloc,
    required this.pageListProvider,
    required this.eventBus,
  }) : super(CollectionState.empty()) {
    eventBus.onEvent(consumer: runtimeType.toString(), eventId: PageEvents.save, handler: _reloadEntitiesAfterSave);
    _initTableSearchListener();
  }

  final ICollectionProvider pageListProvider;
  final ModelListBloc modelListBloc;
  final EventBus eventBus;
  final TextEditingController globalSearchController = TextEditingController();

  Future<void> loadPages(String modelId) async {
    if (state.modelId != modelId) {
      globalSearchController.clear();
    }
    emit(state.copyWith(
      isLoading: true,
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
    ));
  }

  Future<void> _reloadEntitiesAfterSave(Model model) async => loadPages(model.id);

  Future<void> _filterTableByGlobalSearch() async {
    emit(state.copyWith(isGlobalSearchLoading: true));
    await Debouncer.run(id: '_filterTableByGlobalSearch', () async {
      final CollectionResponseDto dto = await _loadData(modelId: state.modelId);
      final List<Json> data = dto.data;
      emit(state.copyWith(isGlobalSearchLoading: false));
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
    int limit = 50,
  }) async {
    final Model? model = modelListBloc.findModelById(modelId);
    if (model == null) {
      throw notFoundModelError(modelId);
    }
    final String query = globalSearchController.text;

    final CollectionResponseDto dto = await pageListProvider.fetchPageList(
      model: model,
      subset: model.listFields.ids,
      params: ParamsDto(
        page: page,
        limit: limit,
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
