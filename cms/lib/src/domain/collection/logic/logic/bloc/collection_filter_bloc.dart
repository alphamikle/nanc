import 'package:bloc/bloc.dart';
import 'package:tools/tools.dart';

import 'collection_filter_state.dart';

class CollectionFilterBloc extends Cubit<CollectionFilterState> {
  CollectionFilterBloc({
    required this.eventBus,
  }) : super(CollectionFilterState.empty());

  final EventBus eventBus;
}
