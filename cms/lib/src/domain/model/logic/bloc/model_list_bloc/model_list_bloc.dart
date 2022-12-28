import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_state.dart';
import 'package:cms/src/domain/model/logic/provider/entity_model_provider.dart';
import 'package:collection/collection.dart';
import 'package:model/model.dart';

class ModelListBloc extends Cubit<ModelListState> {
  ModelListBloc({
    required this.modelProvider,
  }) : super(ModelListState.empty());

  final ModelProvider modelProvider;

  Future<void> loadDynamicModels(List<Model> preloadedEntities) async {
    emit(state.copyWith.isLoading(true));
    final List<Model> models = await modelProvider.fetchModels();

    final Set<String> dynamicModelsIds = {};
    for (final Model entity in models) {
      dynamicModelsIds.add(entity.id);
    }

    final List<Model> filteredPreloadedModels = preloadedEntities.where((Model entity) => dynamicModelsIds.contains(entity.id) == false).toList();
    final List<Model> allModels = [...filteredPreloadedModels, ...models];
    final List<Model> hiddenModels = allModels.where((Model entity) => entity.showInMenu == false).toList();
    final List<Model> collectionModels = allModels.where((Model entity) => entity.isCollection && entity.showInMenu).toList();
    final List<Model> soloModels = allModels.where((Model entity) => entity.isCollection == false && entity.showInMenu).toList();

    collectionModels.sort((Model first, Model second) => first.sort.compareTo(second.sort));
    soloModels.sort((Model first, Model second) => first.sort.compareTo(second.sort));
    hiddenModels.sort((Model first, Model second) => first.sort.compareTo(second.sort));

    emit(state.copyWith(
      preloadedModels: filteredPreloadedModels,
      collectionModels: collectionModels,
      soloModels: soloModels,
      hiddenModels: hiddenModels,
    ));

    emit(state.copyWith.isLoading(false));
  }

  Future<void> reloadDynamicModels() async => loadDynamicModels(state.preloadedModels);

  Model? findModelById(String entityId) {
    final Model? targetModel = state.allModels.firstWhereOrNull((Model entity) => entity.id == entityId);
    return targetModel;
  }
}
