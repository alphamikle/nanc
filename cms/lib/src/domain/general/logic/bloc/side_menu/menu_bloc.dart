import 'package:bloc/bloc.dart';
import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:go_router/go_router.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../service/routing/endpoints.dart';
import '../../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../model/menu_element.dart';
import '../header/menu_state.dart';

class MenuBloc extends Cubit<MenuState> {
  MenuBloc({
    required this.modelListBloc,
  }) : super(MenuState.empty());

  late final GoRouter router;
  final ModelListBloc modelListBloc;

  Future<void> initItems(String headerSegmentUrl) async {
    emit(state.copyWith(isLoading: true));
    final List<MenuElement> elements = [];
    final Endpoint endpoint = Endpoint.fromPath(headerSegmentUrl);

    if (endpoint.isCollectionEndpoint) {
      logg('Endpoint "$headerSegmentUrl" is CollectionSection');
      final List<Model> models = [...modelListBloc.state.collectionModels];
      models.sort(_entitySortingPredicate);
      elements.addAll(models.map(
        (Model model) => MenuElement(
          title: model.name,
          url: Endpoints.collection.model.segment(modelId: model.id),
        ),
      ));
    } else if (endpoint.isSoloEndpoint) {
      logg('Endpoint "$headerSegmentUrl" is SoloSection');
      final List<Model> models = [...modelListBloc.state.soloModels];
      models.sort(_entitySortingPredicate);
      elements.addAll(models.map(
        (Model model) => MenuElement(
          title: model.name,
          url: Endpoints.solo.page.segment(modelId: model.id),
        ),
      ));
    } else if (endpoint.isEditorEndpoint) {
      logg('Endpoint "$headerSegmentUrl" is EditorSection');
      List<Model> models = [...modelListBloc.state.allModels];
      if (Env.isProduction) {
        models = models.where((Model model) => model.id != modelModel.id && model.id != structureModel.id).toList();
      }
      models.sort(_entitySortingPredicate);
      elements.addAll(
        models.map(
          (Model model) => MenuElement(
            title: model.name,
            url: Endpoints.editor.modelEditing.segment(modelId: model.id),
          ),
        ),
      );
    } else {
      logg('Not implemented items loader for "$headerSegmentUrl"');
    }
    emit(state.copyWith(
      elements: elements,
      activeElement: MenuElement.empty(),
      isLoading: false,
      activeHeaderSegment: headerSegmentUrl,
    ));
  }

  Future<void> initItemsChecked(String headerSegmentUrl) async {
    await modelListBloc.waitUntilLoading();
    await initItems(headerSegmentUrl);
  }

  Future<void> reInitItems() async {
    if (state.activeHeaderSegment.isNotEmpty) {
      final MenuElement activeElement = state.activeElement;
      await initItems(state.activeHeaderSegment);
      selectItem(activeElement.url);
    }
  }

  void selectItem(String selectedItemUrl) {
    final Endpoint? endpoint = Endpoint.tryFromPath(selectedItemUrl);
    final MenuElement? menuElement = endpoint == null ? null : state.elements.firstWhereOrNull((MenuElement item) => item.url == selectedItemUrl);

    emit(state.copyWith(
      activeElement: menuElement ?? MenuElement.empty(),
    ));
  }

  bool selectItemIfNoSelected(String menuItemUrl) {
    if (state.activeElement == MenuElement.empty()) {
      selectItem(menuItemUrl);
      return true;
    }
    return false;
  }

  void initRouter(GoRouter router) {
    this.router = router;
  }
}

int _entitySortingPredicate(Model first, Model second) {
  int equality = first.sort.compareTo(second.sort);
  if (equality == 0) {
    equality = first.name.compareTo(second.name);
  }
  if (equality == 0) {
    equality = first.id.compareTo(second.id);
  }
  return equality;
}
