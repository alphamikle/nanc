import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:config/config.dart';

import '../../../../../service/routing/route_list.dart';
import '../../model/menu_element.dart';
import 'menu_state.dart';

const String collectionMenuItemTitle = 'Collection';
const String soloMenuItemTitle = 'Solo';
const String editorMenuItemTitle = 'Editor';
const String rolesMenuItemTitle = 'Roles';
const String settingsMenuItemTitle = 'Settings';
const String iconsMenuItemTitle = 'Icons';

class HeaderBloc extends Cubit<MenuState> {
  HeaderBloc() : super(MenuState.empty());

  void selectItem(String route) {
    final MenuElement? menuElement = state.elements.firstWhereOrNull((MenuElement item) {
      final bool routeMatched = item.url == route;
      if (routeMatched) {
        return true;
      }
      return item.aliases.contains(route);
    });

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
      MenuElement(title: collectionMenuItemTitle, url: Routes.collection(), aliases: Routes.collectionRoutes),
      MenuElement(title: soloMenuItemTitle, url: Routes.solo(), aliases: Routes.soloRoutes),
      MenuElement(title: editorMenuItemTitle, url: Routes.editor(), aliases: Routes.editorRoutes),
      MenuElement(title: rolesMenuItemTitle, url: Routes.roles()),
      MenuElement(title: settingsMenuItemTitle, url: Routes.settings()),
      if (Env.isProduction == false) MenuElement(title: iconsMenuItemTitle, url: Routes.icons()),
    ]);
    emit(state.copyWith(
      elements: items.toList(),
      isLoading: false,
    ));
  }
}
