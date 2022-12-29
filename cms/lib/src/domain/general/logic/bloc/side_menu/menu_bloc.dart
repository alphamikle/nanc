import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/general/logic/bloc/header/menu_state.dart';
import 'package:cms/src/domain/general/logic/model/menu_element.dart';
import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'package:cms/src/domain/model/logic/entity/model_model.dart';
import 'package:cms/src/service/routing/route_list.dart';
import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class MenuBloc extends Cubit<MenuState> {
  MenuBloc({
    required this.modelListBloc,
  }) : super(MenuState.empty());

  final ModelListBloc modelListBloc;

  Future<void> initItems(String headerSegmentUrl) async {
    emit(state.copyWith(isLoading: true));
    final List<MenuElement> elements = [];
    if (Routes.isCollectionRoute(headerSegmentUrl)) {
      final List<Model> entities = [...modelListBloc.state.collectionModels];
      entities.sort(_entitySortingPredicate);
      elements.addAll(entities.map(
        (Model entity) => MenuElement(
          title: entity.name,
          url: Routes.collectionOf(entity.id),
        ),
      ));
    } else if (Routes.isSoloRoute(headerSegmentUrl)) {
      final List<Model> entities = [...modelListBloc.state.soloModels];
      entities.sort(_entitySortingPredicate);
      elements.addAll(entities.map(
        (Model entity) => MenuElement(
          title: entity.name,
          url: Routes.soloModelGateway(entity.id),
        ),
      ));
    } else if (Routes.isEditorRoute(headerSegmentUrl)) {
      List<Model> entities = [...modelListBloc.state.allModels];
      if (Env.isProduction) {
        entities = entities.where((Model model) => model.id != modelModel.id && model.id != structureModel.id).toList();
      }
      entities.sort(_entitySortingPredicate);
      elements.addAll(
        entities.map(
          (Model entity) => MenuElement(
            title: entity.name,
            url: Routes.editModel(entity.id),
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

  Future<void> reInitItems() async {
    if (state.activeHeaderSegment.isNotEmpty) {
      final MenuElement activeElement = state.activeElement;
      await initItems(state.activeHeaderSegment);
      selectItem(activeElement.url);
    }
  }

  void selectItem(String menuItemUrl) {
    final MenuElement? menuElement = state.elements.firstWhereOrNull((MenuElement item) => item.url == menuItemUrl);

    emit(state.copyWith(
      activeElement: menuElement ?? MenuElement.empty(),
    ));
  }
}

int _entitySortingPredicate(Model first, Model second) => first.sort.compareTo(second.sort);
