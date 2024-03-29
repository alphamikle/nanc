import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:nanc_configuration/nanc_configuration.dart';

import '../../../../../service/routing/endpoints.dart';
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
    final Endpoint endpoint = Endpoint.fromPath(route);
    final MenuElement? menuElement = state.elements.firstWhereOrNull((MenuElement item) {
      final bool exactEndpoint = Endpoint.fromPath(item.url) == endpoint;
      if (exactEndpoint) {
        return exactEndpoint;
      }
      return item.aliases.any((String alias) => alias == endpoint.pattern);
    });

    emit(state.copyWith(
      activeElement: menuElement ?? MenuElement.empty(),
    ));
  }

  bool selectItemIfNoSelected(String route) {
    if (state.activeElement == MenuElement.empty()) {
      selectItem(route);
      return true;
    }
    return false;
  }

  Future<void> initItems() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final Set<MenuElement> items = {...state.elements};
    items.addAll([
      MenuElement(title: collectionMenuItemTitle, url: Endpoints.collection.segment(), aliases: Endpoint.collectionEndpoints.aliases),
      MenuElement(title: soloMenuItemTitle, url: Endpoints.solo.segment(), aliases: Endpoint.soloEndpoints.aliases),
      MenuElement(title: editorMenuItemTitle, url: Endpoints.editor.segment(), aliases: Endpoint.editorEndpoints.aliases),
      MenuElement(title: rolesMenuItemTitle, url: Endpoints.roles.segment()),
      MenuElement(title: settingsMenuItemTitle, url: Endpoints.settings.segment()),
      if (Env.isProduction == false) MenuElement(title: iconsMenuItemTitle, url: Endpoints.icons.segment()),
    ]);
    emit(state.copyWith(
      elements: items.toList(),
      isLoading: false,
    ));
  }
}
