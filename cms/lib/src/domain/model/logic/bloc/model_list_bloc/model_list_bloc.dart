import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_state.dart';
import 'package:cms/src/domain/model/logic/provider/entity_model_provider.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class ModelListBloc extends Cubit<ModelListState> {
  ModelListBloc({
    required this.modelProvider,
  }) : super(ModelListState.empty());

  final ModelProvider modelProvider;

  Future<void> preloadModelsFromCode(List<Model> modelsFromCode) async => _sortAndSplitModels(modelsFromCode: modelsFromCode, dynamicModels: []);

  Future<void> loadDynamicModels(List<Model> modelsFromCode) async {
    emit(state.copyWith.isLoading(true));
    final List<Model> models = await modelProvider.fetchModels();
    await _sortAndSplitModels(modelsFromCode: modelsFromCode, dynamicModels: models);
    emit(state.copyWith.isLoading(false));
  }

  Future<void> _sortAndSplitModels({required List<Model> modelsFromCode, required List<Model> dynamicModels}) async {
    final Set<String> dynamicModelsIds = {};
    for (final Model entity in dynamicModels) {
      dynamicModelsIds.add(entity.id);
    }

    final List<Model> filteredPreloadedModels = modelsFromCode.where((Model entity) => dynamicModelsIds.contains(entity.id) == false).toList();
    await wait();
    final List<Model> allModels = [...filteredPreloadedModels, ...dynamicModels];
    await wait();
    final List<Model> hiddenModels = allModels.where((Model entity) => entity.showInMenu == false).toList();
    await wait();
    final List<Model> collectionModels = allModels.where((Model entity) => entity.isCollection && entity.showInMenu).toList();
    await wait();
    final List<Model> soloModels = allModels.where((Model entity) => entity.isCollection == false && entity.showInMenu).toList();
    await wait();

    collectionModels.sort((Model first, Model second) => first.sort.compareTo(second.sort));
    await wait();
    soloModels.sort((Model first, Model second) => first.sort.compareTo(second.sort));
    await wait();
    hiddenModels.sort((Model first, Model second) => first.sort.compareTo(second.sort));
    await wait();

    emit(state.copyWith(
      preloadedModels: filteredPreloadedModels,
      collectionModels: collectionModels,
      soloModels: soloModels,
      hiddenModels: hiddenModels,
    ));
  }

  Future<void> reloadDynamicModels() async => loadDynamicModels(state.preloadedModels);

  Model? findModelById(String modelId) {
    final Model? targetModel = state.allModels.firstWhereOrNull((Model entity) => entity.id == modelId);
    return targetModel;
  }
}
