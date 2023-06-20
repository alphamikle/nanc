import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tools/tools.dart';

import '../../domain/collection/ui/view/collection_view.dart';
import '../../domain/collection/ui/view/empty_collection_view.dart';
import '../../domain/general/ui/view/general_view_v2.dart';
import '../../domain/model/ui/view/model_editor_initial_view.dart';
import '../../domain/model/ui/view/model_page_view.dart';
import '../../domain/page/ui/view/entity_page_view.dart';
import '../../domain/page/ui/view/solo_empty_view.dart';
import '../../domain/roles/ui/view/roles_view.dart';
import '../../domain/welcome/ui/view/welcome_view.dart';
import 'endpoints.dart';
import 'routes_preloading_service.dart';

const bool sandbox = true;

typedef ElementProducer<T> = T Function();

T builder<T>(ElementProducer<T> producer) => producer();

Page<dynamic> defaultTransitionBuilder({required Widget child}) => NoTransitionPage(child: child);

GoRouter buildRouter(RoutesPreloadingService preloadingService, RootKey rootKey) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootKey,
    initialLocation: '/solo/intro_screen',
    routes: [
      /// ? "/"
      GoRoute(
        path: Endpoints.root.segment(),
        name: Endpoints.root.name,
        redirect: (BuildContext context, GoRouterState state) => Endpoints.welcome.segment(),
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) => GeneralViewV2(child: child),
        routes: [
          /// ? "/welcome
          GoRoute(
            path: Endpoints.welcome.segment(),
            name: Endpoints.welcome.name,
            pageBuilder: (BuildContext context, GoRouterState state) => defaultTransitionBuilder(child: const WelcomeView()),
          ),

          /// ? "/collection"
          GoRoute(
            path: Endpoints.collection.segment(),
            name: Endpoints.collection.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectHeaderMenuItem(state));
              return defaultTransitionBuilder(child: const EmptyCollectionView());
            },
          ),

          /// ? "/collection/:modelId"
          GoRoute(
            path: Endpoints.collection.model.segment(),
            name: Endpoints.collection.model.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadCollectionDataList(state));
              return defaultTransitionBuilder(child: const CollectionView());
            },
            routes: [
              /// ? "/collection/:modelId/create"
              GoRoute(
                path: Endpoints.collection.model.pageCreation.segment(),
                name: Endpoints.collection.model.pageCreation.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  unawaited(preloadingService.prepareCollectionPageForCreation(state));
                  return defaultTransitionBuilder(child: const EntityPageView(creationMode: true, soloEntity: false));
                },
              ),

              /// ? "/collection/:modelId/:pageId
              GoRoute(
                path: Endpoints.collection.model.page.segment(),
                name: Endpoints.collection.model.page.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  unawaited(preloadingService.preloadCollectionPage(state));
                  return defaultTransitionBuilder(child: const EntityPageView(creationMode: false, soloEntity: false));
                },
              ),
            ],
          ),

          /// ? "/solo"
          GoRoute(
            path: Endpoints.solo.segment(),
            name: Endpoints.solo.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectHeaderMenuItem(state));
              return defaultTransitionBuilder(child: const SoloEmptyView());
            },
          ),

          /// ? "/solo/:modelId/gateway"
          GoRoute(
            path: Endpoints.solo.gateway.segment(),
            name: Endpoints.solo.gateway.name,
            redirect: (BuildContext context, GoRouterState state) async {
              return preloadingService.resolveSoloPageState(state, rootKey);
            },
          ),

          /// ? "/solo/:modelId
          GoRoute(
            path: Endpoints.solo.page.segment(),
            name: Endpoints.solo.page.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadSoloPage(state));
              return defaultTransitionBuilder(child: const EntityPageView(creationMode: false, soloEntity: true));
            },
          ),

          /// ? "/solo/:modelId/create"
          GoRoute(
            path: Endpoints.solo.pageCreation.segment(),
            name: Endpoints.solo.pageCreation.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.prepareSoloPageForCreation(state));
              return defaultTransitionBuilder(child: const EntityPageView(creationMode: true, soloEntity: true));
            },
          ),

          /// ? "/editor"
          GoRoute(
            path: Endpoints.editor.segment(),
            name: Endpoints.editor.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectHeaderMenuItem(state));
              return defaultTransitionBuilder(child: const ModelEditorInitialView());
            },
          ),

          /// ? "/editor/model?solo=<bool>"
          GoRoute(
            path: Endpoints.editor.modelCreation.segment(),
            name: Endpoints.editor.modelCreation.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.prepareModelForCreation(state));
              return defaultTransitionBuilder(child: const ModelPageView(creationMode: true));
            },
          ),

          /// ? "/editor/model/:modelId"
          GoRoute(
            path: Endpoints.editor.modelEditing.segment(),
            name: Endpoints.editor.modelEditing.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.preloadModel(state));
              return defaultTransitionBuilder(child: const ModelPageView(creationMode: false));
            },
          ),

          /// ? "/roles"
          GoRoute(
            path: Endpoints.roles.segment(),
            name: Endpoints.roles.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectHeaderMenuItem(state));
              return defaultTransitionBuilder(child: const RolesView());
            },
          ),

          /// ? "/settings"
          GoRoute(
            path: Endpoints.settings.segment(),
            name: Endpoints.settings.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectHeaderMenuItem(state));
              return defaultTransitionBuilder(child: const RolesView());
            },
          ),
        ],
      ),
    ],
  );
}
