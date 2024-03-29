import 'package:bloc/bloc.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../field/logic/bloc/local_page_bloc/local_page_bloc.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../../../model/logic/model/logic/model.dart';
import 'collection_filter_state.dart';

class CollectionFilterBlocOld extends Cubit<CollectionFilterState> {
  CollectionFilterBlocOld({
    required this.modelCollectionBloc,
    required this.filterStructureBloc,
  }) : super(CollectionFilterState.empty()) {
    filterStructureBloc.onDataChanged = _onFilterStructureChanged;
  }

  final ModelListBloc modelCollectionBloc;
  final LocalPageBloc filterStructureBloc;

  void apply() {
    logInfo('Apply collection filter: ${state.collectionModel.id}');
    backup();
  }

  void backup() {
    logInfo('Backup collection filter: ${state.collectionModel.id}');
    final QueryField? queryField = queryFieldFromJson(mapQueryFieldCellJsonToQueryFieldJson(filterStructureBloc.state.data));
    if (queryField != null) {
      emit(state.copyWith(
        backup: {
          ...state.backup,
          state.collectionModel.id: filterStructureBloc.state.data,
        },
      ));
    }
  }

  void restoreBackup({bool runAfterRestore = false}) {
    logInfo('Restore backup collection filter: ${state.collectionModel.id}');
    filterStructureBloc.clear();
    filterStructureBloc.updateValues(state.backup[state.collectionModel.id] ?? {});
  }

  void reset() {
    logInfo('Reset collection filter: ${state.collectionModel.id}');
    filterStructureBloc.clear();

    final Json oldBackup = clone(state.backup);
    oldBackup.remove(state.collectionModel.id);

    final Map<ModelId, Json> typedOldBackup = {};
    for (final MapEntry(:key, :value) in oldBackup.entries) {
      if (value is DJson) {
        typedOldBackup[key] = castToJson(value);
      }
    }

    emit(state.copyWith(backup: typedOldBackup));
    apply();
  }

  void setUpModel(String modelId) {
    logInfo('Setup model collection filter: $modelId');
    final Model? model = modelCollectionBloc.tryToFindModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    filterStructureBloc.clear();
    if (state.backup.containsKey(modelId)) {
      final QueryField? query = queryFieldFromJson(mapQueryFieldCellJsonToQueryFieldJson(state.backup[model.id]!));
      if (query == null) {
        emit(state.copyWithNull(query: true));
        emit(state.copyWith(collectionModel: model));
      } else {
        emit(state.copyWith(
          collectionModel: model,
          query: query,
        ));
        restoreBackup();
      }
    } else {
      emit(state.copyWithNull(query: true));
      emit(state.copyWith(collectionModel: model));
    }
  }

  void _onFilterStructureChanged(Json filterStructure) {
    final QueryField? query = queryFieldFromJson(mapQueryFieldCellJsonToQueryFieldJson(filterStructure));
    if (query != state.query) {
      logInfo('Filter changed in collection filter: ${state.collectionModel.id}');
      if (query == null) {
        emit(state.copyWithNull(query: true));
      } else {
        emit(state.copyWith(query: query));
      }
    }
  }
}
