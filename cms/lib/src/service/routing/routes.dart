import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../domain/collection/ui/view/collection_view.dart';
import '../../domain/collection/ui/view/empty_collection_view.dart';
import '../../domain/general/ui/view/general_view_v2.dart';
import '../../domain/model/ui/view/model_editor_initial_view.dart';
import '../../domain/model/ui/view/model_page_view.dart';
import '../../domain/page/ui/view/entity_page_view.dart';
import '../../domain/page/ui/view/solo_empty_view.dart';
import '../../domain/roles/ui/view/roles_view.dart';
import '../../domain/welcome/ui/view/welcome_view.dart';
import 'params_list.dart';
import 'route_list.dart';
import 'routes_preloading_service.dart';

const bool sandbox = true;

typedef ElementProducer<T> = T Function();

T builder<T>(ElementProducer<T> producer) => producer();

GoRouter buildRouter(RoutesPreloadingService preloadingService, GlobalKey<NavigatorState> navigatorKey) {
  return GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.root,
        redirect: (BuildContext context, GoRouterState state) => Routes.welcome,
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) => GeneralViewV2(child: child),
        routes: [
          GoRoute(
            path: Routes.welcome,
            pageBuilder: (BuildContext context, GoRouterState state) => const NoTransitionPage(child: WelcomeView()),
          ),
          GoRoute(
            path: Routes.collection(),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectMenuItems(state));
              return const NoTransitionPage(child: EmptyCollectionView());
            },
          ),
          GoRoute(
            path: Routes.solo(),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectMenuItems(state));
              return const NoTransitionPage(child: SoloEmptyView());
            },
          ),
          GoRoute(
            path: Routes.soloModelGateway(Params.modelId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.resolveSoloPageState(state, navigatorKey));
              return const NoTransitionPage(child: EntityPageView(creationMode: true, soloEntity: true));
            },
          ),
          GoRoute(
            path: Routes.pageOfSoloModel(Params.modelId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadSoloPage(state));
              return const NoTransitionPage(child: EntityPageView(creationMode: false, soloEntity: true));
            },
          ),
          GoRoute(
            path: Routes.createPageOfSoloModel(Params.modelId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.prepareSoloPageForCreation(state));
              return const NoTransitionPage(child: EntityPageView(creationMode: true, soloEntity: true));
            },
          ),
          GoRoute(
            path: Routes.collectionOf(Params.modelId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadCollectionDataList(state));
              return const NoTransitionPage(child: CollectionView());
            },
          ),
          GoRoute(
            path: Routes.pageOfCollectionModel(Params.modelId.param, Params.pageId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadCollectionPage(state));
              return const NoTransitionPage(child: EntityPageView(creationMode: false, soloEntity: false));
            },
          ),
          GoRoute(
            path: Routes.editor(),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectMenuItems(state));
              return const NoTransitionPage(child: ModelEditorInitialView());
            },
          ),
          GoRoute(
            path: Routes.createModelPage(Params.modelId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.prepareCollectionPageForCreation(state));
              return const NoTransitionPage(child: EntityPageView(creationMode: true, soloEntity: false));
            },
          ),
          GoRoute(
            path: Routes.createModel(),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.prepareModelForCreation(state));
              return const NoTransitionPage(child: ModelPageView(creationMode: true));
            },
          ),
          GoRoute(
            path: Routes.editModel(Params.modelId.param),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadModel(state));
              return const NoTransitionPage(child: ModelPageView(creationMode: false));
            },
          ),
          GoRoute(
            path: Routes.roles(),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectMenuItems(state));
              return const NoTransitionPage(child: RolesView());
            },
          ),
          GoRoute(
            path: Routes.settings(),
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectMenuItems(state));
              return const NoTransitionPage(child: RolesView());
            },
          ),
        ],
      ),
    ],
  );
}
