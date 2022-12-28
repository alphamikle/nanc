import 'package:bloc/bloc.dart';
import 'package:cms/src/domain/general/logic/bloc/header/menu_state.dart';
import 'package:cms/src/domain/general/logic/model/menu_element.dart';
import 'package:cms/src/service/routing/route_list.dart';
import 'package:collection/collection.dart';

const String collectionMenuItemTitle = 'Collection';
const String soloMenuItemTitle = 'Solo';
const String editorMenuItemTitle = 'Editor';
const String rolesMenuItemTitle = 'Roles';
const String settingsMenuItemTitle = 'Settings';
const String iconsMenuItemTitle = 'Icons';

class HeaderBloc extends Cubit<MenuState> {
  HeaderBloc() : super(MenuState.empty());

  void selectItem(String menuItemUrl) {
    final MenuElement? menuElement = state.elements.firstWhereOrNull((MenuElement item) => item.url == menuItemUrl);

    emit(state.copyWith(
      activeElement: menuElement ?? MenuElement.empty(),
    ));
  }

  Future<void> initItems() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final Set<MenuElement> items = {...state.elements};
    items.addAll([
      MenuElement(title: collectionMenuItemTitle, url: Routes.collection()),
      MenuElement(title: soloMenuItemTitle, url: Routes.solo()),
      MenuElement(title: editorMenuItemTitle, url: Routes.editor()),
      MenuElement(title: rolesMenuItemTitle, url: Routes.roles()),
      MenuElement(title: settingsMenuItemTitle, url: Routes.settings()),
      MenuElement(title: iconsMenuItemTitle, url: Routes.icons()),
    ]);
    emit(state.copyWith(
      elements: items.toList(),
      isLoading: false,
    ));
  }
}
