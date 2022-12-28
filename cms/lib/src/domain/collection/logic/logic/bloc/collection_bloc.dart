import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/collection/logic/logic/bloc/collection_state.dart';
import 'package:cms/src/domain/collection/logic/logic/provider/page_list_provider.dart';
import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/entity_page_bloc.dart';
import 'package:cms/src/service/errors/errors.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class CollectionBloc extends Cubit<CollectionState> {
  CollectionBloc({
    required this.modelListBloc,
    required this.pageListProvider,
    required this.eventBus,
  }) : super(CollectionState.empty()) {
    eventBus.onEvent(consumer: runtimeType.toString(), eventId: PageEvents.save, handler: _reloadEntitiesAfterSave);
  }

  final PageListProvider pageListProvider;
  final ModelListBloc modelListBloc;
  final EventBus eventBus;

  Future<void> loadPages(String modelId) async {
    emit(state.copyWith.isLoading(true));
    final Model? entity = modelListBloc.findModelById(modelId);
    if (entity == null) {
      throw notFoundModelError(modelId);
    }
    final List<Json> data = await pageListProvider.fetchPageList(
      model: entity,
      subset: entity.listFields.map((Field field) => field.id).toList(),
    );
    emit(state.copyWith(dataRows: data));
    emit(state.copyWith.isLoading(false));
  }

  Future<void> _reloadEntitiesAfterSave(Model model) async => loadPages(model.id);

  /// NEXT PAGE

  /// PREV PAGE

  /// ANY PAGE

  /// FILTER LIST (SEARCH, SORT, ETC)
}
