import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nanc_model/nanc_model.dart';
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
      logInfo('Endpoint "$headerSegmentUrl" is CollectionSection');
      final List<Model> models = [...modelListBloc.state.collectionModels];
      models.sort(_entitySortingPredicate);
      elements.addAll(models.map(
        (Model model) => MenuElement(
          title: model.name,
          url: Endpoints.modelCollection.segment(modelId: model.id),
          aliases: {
            Endpoints.collectionPage.fullPath(modelId: model.id, pageId: '.*'),
            Endpoints.createCollectionPage.fullPath(),
          },
        ),
      ));
    } else if (endpoint.isSoloEndpoint) {
      logInfo('Endpoint "$headerSegmentUrl" is SoloSection');
      final List<Model> models = [...modelListBloc.state.soloModels];
      models.sort(_entitySortingPredicate);
      elements.addAll(models.map(
        (Model model) => MenuElement(
          title: model.name,
          url: Endpoints.soloPage.fullPath(modelId: model.id),
        ),
      ));
    } else if (endpoint.isEditorEndpoint) {
      logInfo('Endpoint "$headerSegmentUrl" is EditorSection');
      final List<Model> models = [...modelListBloc.state.allModels];
      models.sort(_entitySortingPredicate);
      elements.addAll(
        models.map(
          (Model model) => MenuElement(
            title: model.name,
            url: Endpoints.editModel.fullPath(modelId: model.id),
          ),
        ),
      );
    } else {
      logWarning('Not implemented items loader for "$headerSegmentUrl"');
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
    MenuElement? targetMenuElement;
    if (endpoint != null) {
      targetMenuElement = state.elements.firstWhereOrNull((MenuElement menuElement) {
        if (menuElement.url == selectedItemUrl) {
          return true;
        }
        final bool hasMatchedAlias = menuElement.aliases.any((String alias) {
          final RegExp aliasRegExp = RegExp('^$alias\$');

          return aliasRegExp.hasMatch(selectedItemUrl);
        });
        if (hasMatchedAlias) {
          return true;
        }
        return false;
      });
    }

    emit(state.copyWith(
      activeElement: targetMenuElement ?? MenuElement.empty(),
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
