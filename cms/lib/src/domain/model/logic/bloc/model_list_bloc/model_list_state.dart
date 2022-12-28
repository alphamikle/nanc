import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:model/model.dart';

part 'model_list_state.g.dart';

@CopyWith()
class ModelListState extends Equatable {
  const ModelListState({
    required this.preloadedModels,
    required this.collectionModels,
    required this.soloModels,
    required this.hiddenModels,
    required this.isLoading,
  });

  factory ModelListState.empty() => const ModelListState(
        preloadedModels: [],
        collectionModels: [],
        soloModels: [],
        hiddenModels: [],
        isLoading: false,
      );

  final List<Model> preloadedModels;
  final List<Model> collectionModels;
  final List<Model> soloModels;
  final List<Model> hiddenModels;
  final bool isLoading;

  List<Model> get allModels => [
        ...collectionModels,
        ...soloModels,
        ...hiddenModels,
      ];

  @override
  List<Object?> get props => [
        preloadedModels,
        collectionModels,
        soloModels,
        hiddenModels,
        isLoading,
      ];
}
