import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/logic/model.dart';

part 'model_list_state.g.dart';

@autoequal
@CopyWith()
class ModelListState extends Equatable {
  const ModelListState({
    required this.preloadedModels,
    required this.collectionModels,
    required this.soloModels,
    required this.hiddenModels,
    required this.isError,
    required this.isLoading,
  });

  factory ModelListState.empty() => const ModelListState(
        preloadedModels: [],
        collectionModels: [],
        soloModels: [],
        hiddenModels: [],
        isError: false,
        isLoading: false,
      );

  final List<Model> preloadedModels;
  final List<Model> collectionModels;
  final List<Model> soloModels;
  final List<Model> hiddenModels;
  final bool isError;
  final bool isLoading;

  List<Model> get allModels => [
        ...collectionModels,
        ...soloModels,
        ...hiddenModels,
      ];

  @override
  List<Object?> get props => _$props;
}
