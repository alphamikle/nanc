import 'dart:async';

import 'package:tools/tools.dart';
import 'package:vrouter/vrouter.dart';

import '../../domain/collection/logic/logic/bloc/collection_bloc.dart';
import '../../domain/general/logic/bloc/header/header_bloc.dart';
import '../../domain/general/logic/bloc/side_menu/menu_bloc.dart';
import '../../domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../domain/page/logic/bloc/page_bloc/page_bloc.dart';
import 'params_list.dart';
import 'route_list.dart';
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

  Future<void> selectMenuItems(VRedirector vRedirector) async => _selectHeaderMenuElement(vRedirector);

  Future<void> preloadCollectionDataList(VRedirector vRedirector) async {
    _selectSideMenuElement(vRedirector);
    unawaited(collectionBloc.loadCollection(vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? ''));
  }

  Future<void> preloadCollectionPage(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    final String pageId = vRedirector.newVRouterData?.pathParameters[Params.pageId.name] ?? '';
    unawaited(pageBloc.loadPage(entityId, pageId));
  }

  Future<void> resolveSoloPageState(VRedirector vRedirector) async {
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    _selectSideMenuElement(vRedirector);
    final bool isPageExist = await pageBloc.isPageExist(entityId, entityId);
    if (isPageExist) {
      vRedirector.to(Routes.pageOfSoloModel(entityId), isReplacement: true);
    } else {
      vRedirector.to(Routes.createPageOfSoloModel(entityId), isReplacement: true);
    }
  }

  Future<void> preloadSoloPage(VRedirector vRedirector) async {
    final String modelId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(pageBloc.loadPage(modelId, modelId));
  }

  Future<void> prepareSoloPageForCreation(VRedirector vRedirector) async {
    final String modelId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(pageBloc.prepareForCreation(modelId));
  }

  Future<void> prepareCollectionPageForCreation(VRedirector vRedirector) async {
    final String modelId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(pageBloc.prepareForCreation(modelId));
  }

  Future<void> preloadModel(VRedirector vRedirector) async {
    _selectHeaderMenuElement(vRedirector);
    _selectSideMenuElement(vRedirector);
    final String entityId = vRedirector.newVRouterData?.pathParameters[Params.modelId.name] ?? '';
    unawaited(modelPageBloc.loadModel(entityId));
  }

  Future<void> prepareModelForCreation(VRedirector vRedirector) async {
    final QueryParameters? query = vRedirector.newVRouterData?.queryParameters;
    bool isSoloCreation = false;
    if (query?['solo'] == '${true}') {
      isSoloCreation = true;
    }
    unawaited(modelPageBloc.prepareForModelCreation(isSoloCreation: isSoloCreation));
  }

  void _selectHeaderMenuElement(VRedirector vRedirector) {
    if (vRedirector.newVRouterData != null && vRedirector.toUrl != null) {
      final String route = Routes.findRouteByUrlAndParams(vRedirector.toUrl!, vRedirector.newVRouterData!.pathParameters);
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
  }

  void _selectSideMenuElement(VRedirector vRedirector) {
    if (vRedirector.toUrl != null) {
      unawaited(doSomethingWhen(
        condition: () => isAttached,
        interval: kInterval,
        action: () {
          logg('Select side menu element: "${vRedirector.toUrl!}"');
          menuBloc.selectItem(vRedirector.toUrl!);
        },
      ));
    }
  }
}
