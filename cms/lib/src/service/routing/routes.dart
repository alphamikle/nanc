import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tools/tools.dart';

import '../../domain/collection/ui/view/collection_view.dart';
import '../../domain/collection/ui/view/empty_collection_view.dart';
import '../../domain/document/ui/view/entity_page_view.dart';
import '../../domain/document/ui/view/solo_empty_view.dart';
import '../../domain/general/ui/view/general_view_v2.dart';
import '../../domain/model/ui/view/model_editor_initial_view.dart';
import '../../domain/model/ui/view/model_page_view.dart';
import '../../domain/roles/ui/view/roles_view.dart';
import '../../domain/welcome/ui/view/welcome_view.dart';
import 'async_view.dart';
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
    // initialLocation: '/solo/intro_screen',
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
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.selectHeaderMenuItem(state),
                  child: const EmptyCollectionView(),
                ),
              );
            },
          ),

          /// ? "/collection/:modelId"
          GoRoute(
            path: Endpoints.modelCollection.segment(),
            name: Endpoints.modelCollection.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.preloadCollectionDataList(state),
                  child: const CollectionView(),
                ),
              );
            },
            routes: [
              /// ? "/collection/:modelId/create"
              GoRoute(
                path: Endpoints.createCollectionPage.segment(),
                name: Endpoints.createCollectionPage.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return defaultTransitionBuilder(
                    child: AsyncView(
                      callback: () async => preloadingService.prepareCollectionPageForCreation(state),
                      child: const EntityPageView(creationMode: true, soloEntity: false),
                    ),
                  );
                },
              ),

              /// ? "/collection/:modelId/:pageId
              GoRoute(
                path: Endpoints.collectionPage.segment(),
                name: Endpoints.collectionPage.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return defaultTransitionBuilder(
                    child: AsyncView(
                      callback: () async => preloadingService.preloadCollectionPage(state),
                      child: const EntityPageView(creationMode: false, soloEntity: false),
                    ),
                  );
                },
              ),
            ],
          ),

          /// ? "/solo"
          GoRoute(
            path: Endpoints.solo.segment(),
            name: Endpoints.solo.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.selectHeaderMenuItem(state),
                  child: const SoloEmptyView(),
                ),
              );
            },
          ),

          /// ? "/solo/:modelId
          GoRoute(
            path: Endpoints.soloPage.segment(),
            name: Endpoints.soloPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.preloadSoloPage(state),
                  child: const EntityPageView(creationMode: false, soloEntity: true),
                ),
              );
            },
          ),

          /// ? "/editor"
          GoRoute(
            path: Endpoints.editor.segment(),
            name: Endpoints.editor.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.selectHeaderMenuItem(state),
                  child: const ModelEditorInitialView(),
                ),
              );
            },
          ),

          /// ? "/editor/model?solo=<bool>"
          GoRoute(
            path: Endpoints.createModel.segment(),
            name: Endpoints.createModel.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.prepareModelForCreation(state),
                  child: const ModelPageView(creationMode: true),
                ),
              );
            },
          ),

          /// ? "/editor/model/:modelId"
          GoRoute(
            path: Endpoints.editModel.segment(),
            name: Endpoints.editModel.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.preloadModel(state),
                  child: const ModelPageView(creationMode: false),
                ),
              );
            },
          ),

          /// ? "/roles"
          GoRoute(
            path: Endpoints.roles.segment(),
            name: Endpoints.roles.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.selectHeaderMenuItem(state),
                  child: const RolesView(),
                ),
              );
            },
          ),

          /// ? "/settings"
          GoRoute(
            path: Endpoints.settings.segment(),
            name: Endpoints.settings.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              unawaited(preloadingService.selectHeaderMenuItem(state));
              return defaultTransitionBuilder(
                child: AsyncView(
                  callback: () async => preloadingService.selectHeaderMenuItem(state),
                  child: const RolesView(),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
