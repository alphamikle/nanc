import 'dart:async';

import 'package:cms/src/domain/collection/logic/logic/bloc/collection_bloc.dart';
import 'package:cms/src/domain/general/logic/bloc/header/header_bloc.dart';
import 'package:cms/src/domain/general/logic/bloc/side_menu/menu_bloc.dart';
import 'package:cms/src/domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/entity_page_bloc.dart';
import 'package:cms/src/service/routing/params_list.dart';
import 'package:cms/src/service/routing/route_list.dart';
import 'package:cms/src/service/routing/uri_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';
import 'package:vrouter/vrouter.dart';

class RoutesPreloadingService {
  RoutesPreloadingService({
    required this.rootKey,
  });

  final RootKey rootKey;

  BuildContext get context {
    if (rootKey.currentContext == null) {
      throw Exception('Not found root context');
    }
    return rootKey.currentContext!;
  }

  CollectionBloc get entityListBloc => context.read();

  PageBloc get entityPageBloc {
    final BasePageBloc pageBloc = context.read();
    if (pageBloc is PageBloc) {
      return pageBloc;
    }
    throw Exception('Not found $PageBloc in the widget tree');
  }

  ModelPageBloc get entityModelPageBloc => context.read();

  HeaderBloc get headerBloc => context.read();

  MenuBloc get menuBloc => context.read();

  Future<void> preloadCollections(VRedirector vRedirector) async => _selectHeaderMenuElement(vRedirector);

  Future<void> preloadCollectionDataList(VRedirector vRedirector) async {
    _selectSideMenuElement(vRedirector);
    unawaited(entityListBloc.loadPages(vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? ''));
  }

  Future<void> preloadCollectionPage(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    final String pageId = vRedirector.newVRouterData?.pathParameters[Params.pageId.name] ?? '';
    unawaited(entityPageBloc.loadPage(entityId, pageId));
  }

  Future<void> resolveSoloPageState(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    _selectSideMenuElement(vRedirector);
    if (await entityPageBloc.isPageExist(entityId, entityId)) {
      vRedirector.to(Routes.pageOfSoloModel(entityId), isReplacement: true);
    } else {
      vRedirector.to(Routes.createPageOfSoloModel(entityId), isReplacement: true);
    }
  }

  Future<void> preloadSoloPage(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(entityPageBloc.loadPage(entityId, entityId));
  }

  Future<void> prepareSoloPageForCreation(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(entityPageBloc.prepareForCreation(entityId));
  }

  Future<void> prepareCollectionPageForCreation(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(entityPageBloc.prepareForCreation(entityId));
  }

  Future<void> preloadAllModels(VRedirector vRedirector) async => _selectHeaderMenuElement(vRedirector);

  Future<void> preloadModel(VRedirector vRedirector) async {
    _selectSideMenuElement(vRedirector);
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(entityModelPageBloc.loadModel(entityId));
  }

  Future<void> prepareModelForCreation(VRedirector vRedirector) async {
    final QueryParameters? query = vRedirector.newVRouterData?.queryParameters;
    bool isSoloCreation = false;
    if (query?['solo'] == '${true}') {
      isSoloCreation = true;
    }
    unawaited(entityModelPageBloc.prepareForModelCreation(isSoloCreation: isSoloCreation));
  }

  void _selectHeaderMenuElement(VRedirector vRedirector) {
    if (vRedirector.newVRouterData != null && vRedirector.toUrl != null) {
      final String route = Routes.findRouteByUrlAndParams(vRedirector.toUrl!, vRedirector.newVRouterData!.pathParameters);
      headerBloc.selectItem(route);
      unawaited(menuBloc.initItems(route));
    }
  }

  void _selectSideMenuElement(VRedirector vRedirector) {
    if (vRedirector.toUrl != null) {
      menuBloc.selectItem(vRedirector.toUrl!);
    }
  }
}
