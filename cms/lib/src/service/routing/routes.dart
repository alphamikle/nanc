import 'package:analytics/analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

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

List<VRouteElement> buildRoutes(BuildContext context) {
  final RoutesPreloadingService preloadingService = context.read();

  return [
    VRouteRedirector(path: Routes.root, redirectTo: Routes.welcome),
    VGuard(
      beforeEnter: analyticsObserver('BEFORE_ENTER'),
      beforeUpdate: analyticsObserver('BEFORE_UPDATE'),
      stackedRoutes: [
        VNester(
          path: Routes.root,
          widgetBuilder: (Widget child) => GeneralViewV2(child: child),
          nestedRoutes: [
            /// ? /welcome
            VWidget(
              path: Routes.welcome,
              widget: const WelcomeView(),
            ),

            /// ? /collection
            VGuard(
              beforeEnter: preloadingService.selectMenuItems,
              beforeUpdate: preloadingService.selectMenuItems,
              stackedRoutes: [
                VWidget(
                  path: Routes.collection(),
                  widget: const EmptyCollectionView(),
                ),
              ],
            ),

            /// ? /solo
            VGuard(
              beforeEnter: preloadingService.selectMenuItems,
              beforeUpdate: preloadingService.selectMenuItems,
              stackedRoutes: [
                VWidget(
                  path: Routes.solo(),
                  widget: const SoloEmptyView(),
                ),
              ],
            ),

            /// ? /solo/:modelId/gateway
            VGuard(
              beforeEnter: preloadingService.resolveSoloPageState,
              beforeUpdate: preloadingService.resolveSoloPageState,
              stackedRoutes: [
                VWidget(
                  path: Routes.soloModelGateway(Params.modelId.forPath),
                  widget: const EntityPageView(creationMode: true, soloEntity: true),
                ),
              ],
            ),

            /// ? /solo/:modelId
            VGuard(
              beforeEnter: preloadingService.preloadSoloPage,
              beforeUpdate: preloadingService.preloadSoloPage,
              stackedRoutes: [
                VWidget(
                  path: Routes.pageOfSoloModel(Params.modelId.forPath),
                  widget: const EntityPageView(creationMode: false, soloEntity: true),
                ),
              ],
            ),

            /// ? /solo/:modelId/create
            VGuard(
              beforeEnter: preloadingService.prepareSoloPageForCreation,
              beforeUpdate: preloadingService.prepareSoloPageForCreation,
              stackedRoutes: [
                VWidget(
                  path: Routes.createPageOfSoloModel(Params.modelId.forPath),
                  widget: const EntityPageView(creationMode: true, soloEntity: true),
                ),
              ],
            ),

            /// ? /collection/:modelId
            VGuard(
              beforeEnter: preloadingService.preloadCollectionDataList,
              beforeUpdate: preloadingService.preloadCollectionDataList,
              stackedRoutes: [
                VWidget(
                  path: Routes.collectionOf(Params.modelId.forPath),
                  widget: const CollectionView(),
                ),
              ],
            ),

            /// ? /collection/:modelId/:pageId
            VGuard(
              beforeEnter: preloadingService.preloadCollectionPage,
              beforeUpdate: preloadingService.preloadCollectionPage,
              stackedRoutes: [
                VWidget(
                  path: Routes.pageOfCollectionModel(Params.modelId.forPath, Params.pageId.forPath),
                  widget: const EntityPageView(creationMode: false, soloEntity: false),
                ),
              ],
            ),

            /// ? /editor
            VGuard(
              beforeEnter: preloadingService.selectMenuItems,
              stackedRoutes: [
                VWidget(
                  path: Routes.editor(),
                  widget: const ModelEditorInitialView(),
                ),
              ],
            ),

            /// ? /editor/page/:modelId
            VGuard(
              beforeEnter: preloadingService.prepareCollectionPageForCreation,
              beforeUpdate: preloadingService.prepareCollectionPageForCreation,
              stackedRoutes: [
                VWidget(
                  path: Routes.createModelPage(Params.modelId.forPath),
                  widget: const EntityPageView(creationMode: true, soloEntity: false),
                ),
              ],
            ),

            /// ? /editor/model
            VGuard(
              beforeEnter: preloadingService.prepareModelForCreation,
              beforeUpdate: preloadingService.prepareModelForCreation,
              stackedRoutes: [
                VWidget(
                  path: Routes.createModel(),
                  widget: const ModelPageView(creationMode: true),
                ),
              ],
            ),

            /// ? /editor/model/:modelId
            VGuard(
              beforeEnter: preloadingService.preloadModel,
              beforeUpdate: preloadingService.preloadModel,
              stackedRoutes: [
                VWidget(
                  path: Routes.editModel(Params.modelId.forPath),
                  widget: const ModelPageView(creationMode: false),
                ),
              ],
            ),

            /// ? /roles
            VGuard(
              beforeEnter: preloadingService.selectMenuItems,
              beforeUpdate: preloadingService.selectMenuItems,
              stackedRoutes: [
                VWidget(
                  path: Routes.roles(),
                  widget: const RolesView(),
                ),
              ],
            ),

            /// ? /settings
            VGuard(
              beforeEnter: preloadingService.selectMenuItems,
              beforeUpdate: preloadingService.selectMenuItems,
              stackedRoutes: [
                VWidget(
                  path: Routes.settings(),
                  widget: const RolesView(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
