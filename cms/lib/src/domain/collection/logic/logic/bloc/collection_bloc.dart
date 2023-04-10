import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../../cms.dart';
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

  final TextEditingController tableSearchController = TextEditingController();

  Future<void> loadPages(String modelId) async {
    if (state.modelId != modelId) {
      tableSearchController.clear();
    }
    emit(state.copyWith(
      isLoading: true,
      modelId: modelId,
    ));
    final Model? model = modelListBloc.findModelById(modelId);
    if (model == null) {
      throw notFoundModelError(modelId);
    }
    final List<Json> data = await _loadData(model);
    emit(state.copyWith(dataRows: data));
    emit(state.copyWith.isLoading(false));
  }

  Future<void> _reloadEntitiesAfterSave(Model model) async => loadPages(model.id);

  Future<void> _filterTableByGlobalSearch() async {
    emit(state.copyWith(isGlobalSearchLoading: true));
    await Debouncer.run(id: '_filterTableByGlobalSearch', () async {
      final Model? model = modelListBloc.findModelById(state.modelId);
      if (model == null) {
        throw notFoundModelError(state.modelId);
      }
      final List<Json> data = await _loadData(model);
      emit(state.copyWith(
        dataRows: data,
        isGlobalSearchLoading: false,
        notFoundAnything: data.isEmpty,
      ));
    });
  }

  void _initTableSearchListener() {
    tableSearchController.addListener(_filterTableByGlobalSearch);
  }

  Future<List<Json>> _loadData(Model model) async {
    final String query = tableSearchController.text;

    final List<Json> data = await pageListProvider.fetchPageList(
      model: model,
      subset: model.listFields.ids,
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
    return data;
  }

  /// NEXT PAGE

  /// PREV PAGE

  /// ANY PAGE

  /// FILTER LIST (SEARCH, SORT, ETC)
}
