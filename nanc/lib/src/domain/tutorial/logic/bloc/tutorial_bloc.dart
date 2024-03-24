import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tools/tools.dart';

import '../../../general/logic/bloc/header/header_bloc.dart';
import 'tutorial_state.dart';

class TutorialBloc extends Cubit<TutorialState> {
  TutorialBloc({
    required this.dbService,
    required this.rootKey,
  }) : super(TutorialState.empty());

  final GlobalKey _collectionMenuItemKey = GlobalKey();
  final GlobalKey _soloMenuItemKey = GlobalKey();
  final GlobalKey _editorMenuItemKey = GlobalKey();
  final GlobalKey _rolesMenuItemKey = GlobalKey();
  final GlobalKey _settingsMenuItemKey = GlobalKey();

  Map<String, GlobalKey> get _headerMenuKeys => {
        collectionMenuItemTitle: _collectionMenuItemKey,
        soloMenuItemTitle: _soloMenuItemKey,
        editorMenuItemTitle: _editorMenuItemKey,
        rolesMenuItemTitle: _rolesMenuItemKey,
        settingsMenuItemTitle: _settingsMenuItemKey,
      };

  final DbService dbService;
  final RootKey rootKey;

  GlobalKey? keyForHeaderMenuItem(String title) {
    return _headerMenuKeys[title];
  }

  void start() {}
}
