import 'package:cms/src/domain/general/logic/bloc/header/header_bloc.dart';
import 'package:cms/src/domain/tutorial/content/header_menu_content.dart';

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
