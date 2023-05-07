import 'package:bloc/bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'collection_filter_state.dart';

enum CollectionFilterEvents {
  filterChanges,
  collectionLoad,
}

class CollectionFilterBloc extends Cubit<CollectionFilterState> {
  CollectionFilterBloc({
    required this.eventBus,
    required this.modelCollectionBloc,
  }) : super(CollectionFilterState.empty()) {
    eventBus.onEvent(consumer: 'CollectionFilterBloc', eventId: CollectionFilterEvents.collectionLoad, handler: _setUpModel);
  }

  final EventBus eventBus;
  final ModelListBloc modelCollectionBloc;

  void _setUpModel(String modelId) {
    final Model? model = modelCollectionBloc.findModelById(modelId);
    if (model == null) {
      throw notFoundModelError(modelId);
    }
    emit(state.copyWith(collectionModel: model));
  }
}
