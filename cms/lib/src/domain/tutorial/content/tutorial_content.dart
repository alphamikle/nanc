import '../../general/logic/bloc/header/header_bloc.dart';
import 'header_menu_content.dart';

abstract class TutorialContent {
  static Map<String, String> get _headerButtonsDescriptions => {
        collectionMenuItemTitle: collectionDescription,
        soloMenuItemTitle: soloDescription,
        editorMenuItemTitle: editorDescription,
        rolesMenuItemTitle: rolesDescription,
        settingsMenuItemTitle: settingsDescription,
      };

  static String descriptionForHeaderButton(String title) {
    return _headerButtonsDescriptions[title]!.trim();
  }
}
