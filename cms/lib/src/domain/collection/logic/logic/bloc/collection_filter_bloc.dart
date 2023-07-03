import 'package:bloc/bloc.dart';
import 'package:config/config.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../field/logic/bloc/local_page_bloc/local_page_bloc.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'collection_filter_state.dart';

enum CollectionFilterEvents {
  filterChanges,
  collectionLoad,
  globalSearchTriggered,
}

class CollectionFilterBloc extends Cubit<CollectionFilterState> {
  CollectionFilterBloc({
    required this.eventBus,
    required this.modelCollectionBloc,
    required this.filterStructureBloc,
  }) : super(CollectionFilterState.empty()) {
    eventBus.onEvent(consumer: 'CollectionFilterBloc', eventId: CollectionFilterEvents.collectionLoad, handler: _setUpModel);
    filterStructureBloc.onDataChanged = _onFilterStructureChanged;
  }

  final EventBus eventBus;
  final ModelListBloc modelCollectionBloc;
  final LocalPageBloc filterStructureBloc;

  void apply() {
    backup();
    eventBus.send(eventId: CollectionFilterEvents.filterChanges, request: state.query);
  }

  void backup() {
    emit(state.copyWith(
      backup: filterStructureBloc.state.data,
    ));
  }

  void restoreBackup() {
    filterStructureBloc.clear();
    filterStructureBloc.updateValues(state.backup);
  }

  void reset() {
    filterStructureBloc.clear();
    emit(state.copyWith());
    apply();
  }

  void _setUpModel(String modelId) {
    final Model? model = modelCollectionBloc.tryToFindModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    emit(state.copyWith(collectionModel: model));
  }

  void _onFilterStructureChanged(Json filterStructure) {
    final QueryField? query = queryFieldFromJson(mapQueryFieldCellJsonToQueryFieldJson(filterStructure));
    emit(state.copyWith(query: query));
  }
}
