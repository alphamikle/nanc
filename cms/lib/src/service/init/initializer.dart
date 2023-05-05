import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../../../cms.dart';
import '../../domain/collection/logic/logic/bloc/collection_bloc.dart';
import '../../domain/collection/logic/logic/bloc/collection_filter_bloc.dart';
import '../../domain/collection/logic/logic/provider/collection_provider.dart';
import '../../domain/draft/logic/draft_service.dart';
import '../../domain/general/logic/bloc/header/header_bloc.dart';
import '../../domain/general/logic/bloc/side_menu/menu_bloc.dart';
import '../../domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../domain/model/logic/provider/model_provider.dart';
import '../../domain/page/logic/provider/entity_page_provider.dart';
import '../../domain/preview/logic/bloc/preview_bloc.dart';
import '../../domain/tutorial/logic/bloc/tutorial_bloc.dart';
import '../errors/error_wrapper.dart';
import '../routing/routes_preloading_service.dart';
import 'data_repository.dart';

class Initializer {
  Initializer({
    required this.config,
    required this.rootKey,
    required this.errorStreamController,
  });

  final CmsConfig config;
  final StreamController<ErrorWrapper> errorStreamController;
  final RootKey rootKey;

  final List<BlocProvider<dynamic>> blocProviders = [];
  final List<RepositoryProvider<dynamic>> repositoryProviders = [];

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
    final ModelProvider modelProvider = ModelProvider(pageProvider: pageProvider, collectionProvider: collectionProvider);

    /// ? ENTITY WITH NAV
    final ModelListBloc modelCollectionBloc = ModelListBloc(modelProvider: modelProvider);

    /// ? BLOCS
    final PreviewBloc previewBloc = PreviewBloc(eventBus: eventBus);
    final EditorBloc editorBloc = EditorBloc(eventBus: eventBus);
    final MenuBloc menuBloc = MenuBloc(modelListBloc: modelCollectionBloc);
    final HeaderBloc headerBloc = HeaderBloc();
    final ModelPageBloc modelPageBloc = ModelPageBloc(
      modelListBloc: modelCollectionBloc,
      rootKey: rootKey,
      modelProvider: modelProvider,
      menuBloc: menuBloc,
    );
    final TutorialBloc tutorialBloc = TutorialBloc(dbService: dbService, rootKey: rootKey);
    final CollectionFilterBloc collectionFilterBloc = CollectionFilterBloc(eventBus: eventBus);
    final CollectionBloc collectionBloc = CollectionBloc(
      modelListBloc: modelCollectionBloc,
      pageListProvider: collectionProvider,
      eventBus: eventBus,
    );
    final PageBloc pageBloc = PageBloc(
      modelListBloc: modelCollectionBloc,
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

    /// ? PRE-INITIALIZATION
    await modelCollectionBloc.preloadModelsFromCode(config.predefinedModels);
    unawaited(modelCollectionBloc.loadDynamicModels(config.predefinedModels));
    unawaited(headerBloc.initItems());

    final DataRepository dataRepository = DataRepository(
      clickHandlers: config.clickHandlers,
      renderers: config.customRenderers,
      imageLoadingBuilder: config.imageBuilderDelegate?.imageLoadingBuilder,
      imageErrorBuilder: config.imageBuilderDelegate?.imageErrorWidgetBuilder,
      imageFrameBuilder: config.imageBuilderDelegate?.imageFrameBuilder,
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
      ]);
    return true;
  }
}
