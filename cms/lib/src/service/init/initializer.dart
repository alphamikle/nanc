import 'dart:async';

import 'package:config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';

import '../../../cms.dart';
import '../../domain/collection/logic/logic/bloc/collection_bloc.dart';
import '../../domain/collection/logic/logic/provider/collection_provider.dart';
import '../../domain/draft/logic/draft_service.dart';
import '../../domain/general/logic/bloc/header/header_bloc.dart';
import '../../domain/general/logic/bloc/side_menu/menu_bloc.dart';
import '../../domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../domain/model/logic/provider/model_provider.dart';
import '../../domain/page/logic/provider/page_provider.dart';
import '../../domain/preview/logic/bloc/preview_bloc.dart';
import '../../domain/tutorial/logic/bloc/tutorial_bloc.dart';
import '../routing/routes_preloading_service.dart';

class Initializer {
  Initializer({
    required this.config,
    required this.rootKey,
    required this.errorStreamController,
  });

  final CmsConfig config;
  final StreamController<HumanException> errorStreamController;
  final RootKey rootKey;

  final List<BlocProvider<dynamic>> blocProviders = [];
  final List<RepositoryProvider<dynamic>> repositoryProviders = [];
  late final GoRouter router;

  Future<bool> init() async {
    /// ? FONTS
    config.customFonts.forEach(registerCustomFont);

    /// ? SERVICES
    final EventBus eventBus = EventBus();
    final DbService dbService = DbService();
    final DraftService draftService = DraftService(dbService: dbService);

    /// ? PROVIDERS
    final PageProvider pageProvider = PageProvider(api: config.pageApi);
    final CollectionProvider collectionProvider = CollectionProvider(api: config.collectionApi);
    final ModelProvider modelProvider = ModelProvider(
      pageProvider: pageProvider,
      collectionProvider: collectionProvider,
      modelApi: config.modelApi,
    );

    /// ? ENTITY WITH NAV
    final ModelListBloc modelCollectionBloc = ModelListBloc(modelProvider: modelProvider);

    /// ? BLOCS
    final PreviewBloc previewBloc = PreviewBloc(eventBus: eventBus);
    final EditorBloc editorBloc = EditorBloc(eventBus: eventBus);
    final MenuBloc menuBloc = MenuBloc(modelListBloc: modelCollectionBloc);
    final HeaderBloc headerBloc = HeaderBloc();
    final ModelPageBloc modelPageBloc = ModelPageBloc(
      modelCollectionBloc: modelCollectionBloc,
      rootKey: rootKey,
      modelProvider: modelProvider,
      menuBloc: menuBloc,
    );
    final TutorialBloc tutorialBloc = TutorialBloc(dbService: dbService, rootKey: rootKey);
    final CollectionFilterBloc collectionFilterBloc = CollectionFilterBloc(
      eventBus: eventBus,
      modelCollectionBloc: modelCollectionBloc,
      filterStructureBloc: LocalPageBloc(draftService: draftService),
    );
    final CollectionBloc collectionBloc = CollectionBloc(
      modelCollectionBloc: modelCollectionBloc,
      pageListProvider: collectionProvider,
      eventBus: eventBus,
    );
    final PageBloc pageBloc = PageBloc(
      modelCollectionBloc: modelCollectionBloc,
      pageProvider: pageProvider,
      eventBus: eventBus,
      draftService: draftService,
    );
    final RoutesPreloadingService routesPreloadingService = RoutesPreloadingService(
      collectionBloc: collectionBloc,
      headerBloc: headerBloc,
      menuBloc: menuBloc,
      modelPageBloc: modelPageBloc,
      pageBloc: pageBloc,
      rootKey: rootKey,
    );
    router = buildRouter(routesPreloadingService, rootKey);
    final SettingsBloc settingsBloc = SettingsBloc(dbService: dbService);
    menuBloc.initRouter(router);

    /// ? PRE-INITIALIZATION
    await modelCollectionBloc.preloadModelsFromCode(config.predefinedModels);
    unawaited(modelCollectionBloc.loadDynamicModels(config.predefinedModels));
    unawaited(settingsBloc.preloadSettings());
    unawaited(headerBloc.initItems());

    final DataRepository dataRepository = DataRepository(
      clickHandlers: config.clickHandlers,
      renderers: [...config.customRenderers, ...TagsCollection.renderers],
      imageLoadingBuilder: config.imageBuilderDelegate?.imageLoadingBuilder,
      imageErrorBuilder: config.imageBuilderDelegate?.imageErrorWidgetBuilder,
      imageFrameBuilder: config.imageBuilderDelegate?.imageFrameBuilder,
      supportedFilters: config.collectionApi.supportedFilters,
    );

    blocProviders
      ..clear()
      ..addAll([
        BlocProvider<PreviewBloc>.value(value: previewBloc),
        BlocProvider<EditorBloc>.value(value: editorBloc),
        BlocProvider<MenuBloc>.value(value: menuBloc),
        BlocProvider<ModelListBloc>.value(value: modelCollectionBloc),
        BlocProvider<CollectionBloc>.value(value: collectionBloc),
        BlocProvider<BasePageBloc<BaseEntityPageState>>.value(value: pageBloc),
        BlocProvider<PageBloc>.value(value: pageBloc),
        BlocProvider<ModelPageBloc>.value(value: modelPageBloc),
        BlocProvider<HeaderBloc>.value(value: headerBloc),
        BlocProvider<TutorialBloc>.value(value: tutorialBloc),
        BlocProvider<CollectionFilterBloc>.value(value: collectionFilterBloc),
        BlocProvider<SettingsBloc>.value(value: settingsBloc),
      ]);

    repositoryProviders
      ..clear()
      ..addAll([
        RepositoryProvider<RootKey>.value(value: rootKey),
        RepositoryProvider<EventBus>.value(value: eventBus),
        RepositoryProvider<ModelProvider>.value(value: modelProvider),
        RepositoryProvider<ICollectionProvider>.value(value: collectionProvider),
        RepositoryProvider<CollectionProvider>.value(value: collectionProvider),
        RepositoryProvider<IPageProvider>.value(value: pageProvider),
        RepositoryProvider<PageProvider>.value(value: pageProvider),
        RepositoryProvider<NetworkConfig>.value(value: config.networkConfig),
        RepositoryProvider<RoutesPreloadingService>.value(value: routesPreloadingService),
        RepositoryProvider<DraftService>.value(value: draftService),
        RepositoryProvider<DataRepository>.value(value: dataRepository),
        RepositoryProvider<StreamController<HumanException>>.value(value: errorStreamController),
      ]);
    return true;
  }
}
