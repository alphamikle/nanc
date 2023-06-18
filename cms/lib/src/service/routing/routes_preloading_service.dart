import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tools/tools.dart';

import '../../domain/collection/logic/logic/bloc/collection_bloc.dart';
import '../../domain/general/logic/bloc/header/header_bloc.dart';
import '../../domain/general/logic/bloc/side_menu/menu_bloc.dart';
import '../../domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../domain/page/logic/bloc/page_bloc/page_bloc.dart';
import 'endpoints.dart';
import 'params_list.dart';
import 'uri_extension.dart';

const Duration kInterval = Duration(milliseconds: 500);

class RoutesPreloadingService {
  RoutesPreloadingService({
    required this.modelPageBloc,
    required this.pageBloc,
    required this.headerBloc,
    required this.menuBloc,
    required this.collectionBloc,
    required this.rootKey,
  });

  final ModelPageBloc modelPageBloc;
  final PageBloc pageBloc;
  final HeaderBloc headerBloc;
  final MenuBloc menuBloc;
  final CollectionBloc collectionBloc;
  final RootKey rootKey;

  bool get isAttached => rootKey.currentContext != null;

  Future<void> selectMenuItems(GoRouterState tate) async => _selectHeaderMenuElement(tate);

  Future<void> preloadCollectionDataList(GoRouterState state) async {
    _selectSideMenuElement(state);
    unawaited(collectionBloc.loadCollection(state.pathParameters[Params.modelId.name] ?? ''));
  }

  Future<void> preloadCollectionPage(GoRouterState state) async {
    final String entityId = state.pathParameters[Params.modelId.name] ?? '';
    final String pageId = state.pathParameters[Params.pageId.name] ?? '';
    unawaited(pageBloc.loadPage(entityId, pageId));
  }

  Future<String> resolveSoloPageState(GoRouterState state, GlobalKey<NavigatorState> key) async {
    final String modelId = state.pathParameters[Params.modelId.name] ?? '';
    _selectSideMenuElement(state);
    final bool isPageExist = await pageBloc.isPageExist(modelId, modelId);
    if (isPageExist) {
      return Endpoints.solo.page.segment(modelId: modelId);
    } else {
      return Endpoints.solo.pageCreation.segment(modelId: modelId);
    }
  }

  Future<void> preloadSoloPage(GoRouterState state) async {
    final String modelId = state.pathParameters[Params.modelId.name] ?? '';
    unawaited(pageBloc.loadPage(modelId, modelId));
  }

  Future<void> prepareSoloPageForCreation(GoRouterState state) async {
    final String modelId = state.pathParameters[Params.modelId.name] ?? '';
    unawaited(pageBloc.prepareForCreation(modelId));
  }

  Future<void> prepareCollectionPageForCreation(GoRouterState state) async {
    final String modelId = state.pathParameters[Params.modelId.name] ?? '';
    unawaited(pageBloc.prepareForCreation(modelId));
  }

  Future<void> preloadModel(GoRouterState state) async {
    _selectHeaderMenuElement(state);
    _selectSideMenuElement(state);
    final String entityId = state.pathParameters[Params.modelId.name] ?? '';
    unawaited(modelPageBloc.loadModel(entityId));
  }

  Future<void> prepareModelForCreation(GoRouterState state) async {
    final QueryParameters query = state.queryParameters;
    bool isSoloCreation = false;
    if (query['solo'] == '${true}') {
      isSoloCreation = true;
    }
    unawaited(modelPageBloc.prepareForModelCreation(isSoloCreation: isSoloCreation));
  }

  void _selectHeaderMenuElement(GoRouterState state) {
    final String route = state.location;
    unawaited(doSomethingWhen(
      condition: () => isAttached,
      interval: kInterval,
      action: () {
        logg('Select header menu element: "$route"');
        headerBloc.selectItem(route);
        unawaited(menuBloc.initItems(route));
      },
    ));
  }

  void _selectSideMenuElement(GoRouterState state) {
    unawaited(doSomethingWhen(
      condition: () => isAttached,
      interval: kInterval,
      action: () {
        logg('Select side menu element: "${state.location}"');
        menuBloc.selectItem(state.location);
      },
    ));
  }
}
