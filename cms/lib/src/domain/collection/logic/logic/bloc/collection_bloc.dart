import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../../../page/logic/bloc/page_bloc/page_bloc.dart';
import '../dto/page_list_response_dto.dart';
import '../dto/params_dto.dart';
import '../dto/query_dto.dart';
import '../dto/query_parameter.dart';
import '../dto/query_parameter_value.dart';
import '../provider/page_list_provider.dart';
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

  final PageListProvider pageListProvider;
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
    ));
    final PageListResponseDto response = await _loadData(modelId: modelId);
    emit(state.copyWith(
      dataRows: response.data,
      totalPages: response.totalPages,
      currentPage: response.page,
    ));
    emit(state.copyWith.isLoading(false));
  }

  Future<void> _reloadEntitiesAfterSave(Model model) async => loadPages(model.id);

  Future<void> _filterTableByGlobalSearch() async {
    emit(state.copyWith(isGlobalSearchLoading: true));
    await Debouncer.run(id: '_filterTableByGlobalSearch', () async {
      final PageListResponseDto response = await _loadData(modelId: state.modelId);
      final List<Json> data = response.data;
      emit(state.copyWith(
        dataRows: data,
        isGlobalSearchLoading: false,
        notFoundAnything: data.isEmpty,
        currentPage: response.page,
        totalPages: response.totalPages,
      ));
    });
  }

  void _initTableSearchListener() {
    globalSearchController.addListener(_filterTableByGlobalSearch);
  }

  Future<PageListResponseDto> _loadData({
    required String modelId,
    int page = 1,
    int limit = 50,
  }) async {
    final Model? model = modelListBloc.findModelById(modelId);
    if (model == null) {
      throw notFoundModelError(modelId);
    }
    final String query = globalSearchController.text;

    final PageListResponseDto response = await pageListProvider.fetchPageList(
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
    return response;
  }

  Future<void> paginate(int page) async {
    final PageListResponseDto response = await _loadData(
      modelId: state.modelId,
      page: page,
    );
    emit(state.copyWith(
      dataRows: response.data,
      currentPage: response.page,
      totalPages: response.totalPages,
      notFoundAnything: response.data.isEmpty,
    ));
  }

  /// NEXT PAGE

  /// PREV PAGE

  /// ANY PAGE

  /// FILTER LIST (SEARCH, SORT, ETC)
}
