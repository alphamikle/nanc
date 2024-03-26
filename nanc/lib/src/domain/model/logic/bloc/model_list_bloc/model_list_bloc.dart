import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:config/config.dart';
import 'package:model/model.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../../service/errors/human_exception.dart';
import '../../provider/model_provider.dart';
import 'model_list_state.dart';

class ModelListBloc extends Cubit<ModelListState> {
  ModelListBloc({
    required this.modelProvider,
  }) : super(ModelListState.empty());

  final ModelProvider modelProvider;

  Future<void> preloadModelsFromCode(List<Model> modelsFromCode) async => _sortAndSplitModels(modelsFromCode: modelsFromCode, dynamicModels: []);

  Future<void> loadDynamicModels(List<Model> modelsFromCode) async {
    emit(state.copyWith(isLoading: true, isError: false));
    try {
      final List<Model> models = await modelProvider.fetchModels();
      await _sortAndSplitModels(
        modelsFromCode: modelsFromCode,
        dynamicModels: models,
      );
    } catch (error) {
      emit(state.copyWith(
        isError: true,
        isLoading: false,
      ));
      throw error.toHumanException('Dynamic models loading failed!');
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _sortAndSplitModels({required List<Model> modelsFromCode, required List<Model> dynamicModels}) async {
    final List<Model> devModelsFromCode = [...modelsFromCode];
    if (Env.isProduction == false) {
      if (devModelsFromCode.any((Model model) => model.id == modelModel.id || model.id == structureModel.id) == false) {
        devModelsFromCode.addAll([modelModel, structureModel]);
      }
    }

    final Set<String> dynamicModelsIds = {};
    final Set<String> codeFirstModelsIds = devModelsFromCode.map((Model model) => model.id).toSet();
    final List<Model> dynamicOrHybridModels = dynamicModels.map((Model model) {
      dynamicModelsIds.add(model.id);
      return codeFirstModelsIds.contains(model.id) ? model.copyWith(isHybrid: true) : model;
    }).toList();

    final List<Model> filteredPreloadedModels = devModelsFromCode.where((Model entity) => dynamicModelsIds.contains(entity.id) == false).toList();
    await wait();
    final List<Model> allModels = [...filteredPreloadedModels, ...dynamicOrHybridModels];
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
      preloadedModels: devModelsFromCode,
      collectionModels: collectionModels,
      soloModels: soloModels,
      hiddenModels: hiddenModels,
    ));
  }

  Future<void> reloadDynamicModels() async => loadDynamicModels(state.preloadedModels);

  Model? tryToFindModelById(String modelId) {
    final Model? targetModel = state.allModels.firstWhereOrNull((Model entity) => entity.id == modelId);
    return targetModel;
  }

  Model findModelById(String modelId) {
    final Model? model = tryToFindModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    return model;
  }

  Future<Model?> tryToFindModelByIdChecked(String modelId) async {
    await waitUntilLoading();
    return tryToFindModelById(modelId);
  }

  Future<void> waitUntilLoading() async {
    await doSomethingWhen(action: () {}, condition: () => state.isLoading == false, interval: const Duration(milliseconds: 100));
  }
}
